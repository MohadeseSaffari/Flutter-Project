import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class CourseExercisesPage extends StatefulWidget {
  final int courseId;

  const CourseExercisesPage({Key? key, required this.courseId}) : super(key: key);

  @override
  _CourseExercisesPageState createState() => _CourseExercisesPageState();
}

class _CourseExercisesPageState extends State<CourseExercisesPage> {
  Future<List<Exercise>>? _futureExercises;

  @override
  void initState() {
    super.initState();
    _futureExercises = fetchExercises();
  }

  Future<List<Exercise>> fetchExercises() async {
    final response = await http.get(Uri.parse('http://192.168.201.48/api_clothes_store/classes/get_course_exercises.php?course_id=${widget.courseId}'));

    if (response.statusCode == 200) {
      print("Response body: ${response.body}"); // Debugging line
      try {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((exercise) => Exercise.fromJson(exercise)).toList();
      } catch (e) {
        print("Error decoding JSON: $e");
        return [];
      }
    } else {
      throw Exception('Failed to load exercises');
    }
  }

  Future<void> _uploadPDF(int exerciseId) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path!, filename: file.name),
        'exercise_id': exerciseId.toString(),
      });

      try {
        Response response = await Dio().post(
          'http://192.168.201.48/api_clothes_store/upload_assignment.php',
          data: formData,
        );

        if (response.statusCode == 200) {
          var resBody = jsonDecode(response.data);
          if (resBody['success']) {
            Fluttertoast.showToast(msg: "File uploaded successfully");
          } else {
            Fluttertoast.showToast(msg: "Failed to upload file");
          }
        } else {
          Fluttertoast.showToast(msg: "Failed to upload file");
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "An error occurred: $e");
      }
    } else {
      // User canceled the picker
    }
  }

  String getTimeLeft(DateTime deadline) {
    Duration timeLeft = deadline.difference(DateTime.now());
    if (timeLeft.isNegative) {
      return "Deadline passed";
    } else {
      int days = timeLeft.inDays;
      int hours = timeLeft.inHours % 24;
      int minutes = timeLeft.inMinutes % 60;
      return "${days}d ${hours}h ${minutes}m left";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Exercises', style: TextStyle(color: Colors.white70)),
        backgroundColor: Color(0xff402fcc),
      ),
      body: Center(
        child: FutureBuilder<List<Exercise>>(
          future: _futureExercises,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text("No exercises found");
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Exercise exercise = snapshot.data![index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exercise.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Description: ${exercise.description}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Deadline: ${exercise.deadline.toLocal()}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            getTimeLeft(exercise.deadline),
                            style: TextStyle(
                              fontSize: 14,
                              color: timeLeftColor(exercise.deadline),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => _uploadPDF(exercise.id),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff402fcc),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            ),
                            child: Text(
                              'Upload PDF',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Color timeLeftColor(DateTime deadline) {
    Duration timeLeft = deadline.difference(DateTime.now());
    if (timeLeft.isNegative) {
      return Colors.red;
    } else if (timeLeft.inDays <= 1) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}

class Exercise {
  final int id;
  final String title;
  final String description;
  final DateTime deadline;

  Exercise({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      deadline: DateTime.tryParse(json['deadline']) ?? DateTime.now(),
    );
  }
}
