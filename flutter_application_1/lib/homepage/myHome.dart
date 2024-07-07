import 'dart:async';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/homepage/myCallender.dart';
import 'package:flutter_application_1/todo_page/todoHome.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/handle.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/userPerfrences/current_user.dart';
import 'package:flutter_application_1/userPerfrences/user_perfrences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  final PageController pageController;
  MyHomePage({required this.pageController});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  final CurrentUser _currentUser = Get.put(CurrentUser());
  int studentId = 1; // Example student ID
  Future<List<Course>>? _futureCourses;

  @override
  void initState() {
    super.initState();
    _futureCourses = fetchCourses();
    // Fetch user info when the page initializes
    _currentUser.getUserInfo();
  }

  Future<List<Course>> fetchCourses() async {
    studentId = _currentUser.user.user_id;
    final response = await http.get(Uri.parse('http://192.168.201.48/api_clothes_store/classes/get_student_courses.php?student_id=$studentId'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((course) => Course.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }
  //az inja
  Future<List<Exercise>> fetchExercises(int courseId) async {
    courseId = 1;
    final response = await http.get(Uri.parse('http://192.168.201.48/api_clothes_store/classes/get_course_exercises.php?course_id=$courseId'));

    if (response.statusCode == 200) {
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
  //ta inja
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String day = DateFormat('EEE').format(now);
    String date = DateFormat('d MMM').format(now);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 56, 18, 194),
                    Color(0xFFF0F0F0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 0.3])),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                      text: "$day",
                      style: TextStyle(
                          color: Color.fromARGB(255, 142, 157, 233),
                          fontSize: 12,
                          fontWeight: FontWeight.w900),
                      children: [
                        TextSpan(
                          text: " $date",
                          style: TextStyle(
                              color: Color.fromARGB(255, 142, 157, 233),
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
              ),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 8,
                        )
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/profile2.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi " + _currentUser.user.user_name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Here is a list of schedule",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "You need to check...",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 185,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height - 245,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: FutureBuilder<List<Course>>(
              future: _futureCourses,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("Open Your Profile First Then you can see your courses here if you have any course:)"));
                } else {
                  return ListView(
                    children: [
                      buildTitleRow(
                        "YOUR CLASSES",
                        snapshot.data!.length,
                        () => widget.pageController.jumpToPage(3),
                      ),
                      SizedBox(height: 20),
                       ...snapshot.data!.map((course) => buildClassItem(course)).toList(),
                      SizedBox(height: 25),
                      buildTitleRow(
                        "YOUR Exercises",
                        4, // Adjust this number as needed
                        () => widget.pageController.jumpToPage(3),
                      ),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: snapshot.data!.map((course) {
                            return FutureBuilder<List<Exercise>>(
                              future: fetchExercises(course.courseId),
                              builder: (context, exerciseSnapshot) {
                                if (exerciseSnapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                } else if (exerciseSnapshot.hasError) {
                                  return Center(child: Text("${exerciseSnapshot.error}"));
                                } else if (!exerciseSnapshot.hasData || exerciseSnapshot.data!.isEmpty) {
                                  return Center(child: Text("No exercises available"));
                                } else {
                                  return Row(
                                    children: exerciseSnapshot.data!.map((exercise) {
                                      return buildTaskItem(
                                        getTimeLeftInDays(exercise.deadline),
                                        exercise.title,
                                        getRandomColor(),
                                      );
                                    }).toList(),
                                  );
                                }
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  int getTimeLeftInDays(DateTime deadline) {
    Duration timeLeft = deadline.difference(DateTime.now());
    return timeLeft.isNegative ? 0 : timeLeft.inDays;
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  Container buildTaskItem(int numDays, String courseTitle, Color color) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(12),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deadline",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(width: 5),
              Text(
                "$numDays days left",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: 100,
            child: Text(
              courseTitle,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

 Container buildClassItem(Course course) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "07:00",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "AM",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  course.courseTitle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://maps.app.goo.gl/n1W1VD7xofHXqVAL7'; // Example URL
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Text(
                        "ShahidBeheshti Computer Engineering Faculty",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.blue, fontSize: 13, decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/profile3.png"),
                    radius: 10,
                  ),
                  SizedBox(width: 5),
                  Text(
                    course.teacherName,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildTitleRow(String title, int count, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: "$title ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.black87,
            ),
            children: [
              TextSpan(
                text: "($count)",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "See all",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 142, 157, 233),
            ),
          ),
        ),
      ],
    );
  }
}

class Course {
  final int courseId;
  final String courseTitle;
  final String teacherName;

  Course({
    required this.courseId,
    required this.courseTitle,
    required this.teacherName,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['course_id'] ?? 0,
      courseTitle: json['course_title'] ?? '',
      teacherName: json['teacher_name'] ?? '',
    );
  }
}

class Exercise {
  final int exerciseId;
  final String title;
  final DateTime deadline;

  Exercise({
    required this.exerciseId,
    required this.title,
    required this.deadline,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      exerciseId: json['exercise_id'] ?? 0,
      title: json['title'] ?? '',
      deadline: DateTime.tryParse(json['deadline']) ?? DateTime.now(),
    );
  }
}
