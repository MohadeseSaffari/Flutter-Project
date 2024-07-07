import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/api_connection/api_connection.dart';

class ClassesPage extends StatefulWidget {
  //final int studentId;

  //ClassesPage({required this.studentId});

  @override
  _ClassesPageState createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  List<dynamic> _classes = [];
  final TextEditingController _classIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchClasses();
  }

  Future<void> _fetchClasses() async {
    final response = await http.get(Uri.parse(api.Classes));

    if (response.statusCode == 200) {
      setState(() {
        _classes = json.
        decode(response.body);
      });
    } else {
      throw Exception('Failed to load classes');
    }
  }

  Future<void> _addStudentToClass(int studentId, int classId) async {
    final response = await http.post(
      Uri.parse(api.AddStudent),
      body: {'student_id': studentId.toString(), 'class_id': classId.toString()},
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added to class successfully')),
      );
    } else {
      throw Exception('Failed to add to class');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _classIdController,
              decoration: InputDecoration(
                labelText: 'Enter Class ID',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_classIdController.text.isNotEmpty) {
                final classId = int.tryParse(_classIdController.text);
                if (classId != null) {
                  //_addStudentToClass(widget.studentId, classId);
                  _classIdController.clear();
                }
              }
            },
            child: Text('Join Class'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _classes.length,
              itemBuilder: (context, index) {
                final classInfo = _classes[index];
                return Card(
                  child: ListTile(
                    title: Text(classInfo['course_name']),
                    subtitle: Text('Teacher: ${classInfo['teacher_name']}'),
                    trailing: Text('ID: ${classInfo['id']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}