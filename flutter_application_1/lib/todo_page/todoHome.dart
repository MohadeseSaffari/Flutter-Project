import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/todo_page/colors.dart';
import 'package:flutter_application_1/todo_page/note.dart';
import 'package:flutter_application_1/todo_page/todoEdit.dart';

class TodoHomeScreen extends StatefulWidget {
  final int studentId;

  const TodoHomeScreen({super.key, required this.studentId});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  List<Note> filteredNotes = [];
  bool sorted = false;

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    final response = await http.get(Uri.parse('http://192.168.201.48/api_clothes_store/todo/get_notes.php?student_id=${widget.studentId}'));
    if (response.statusCode == 200) {
      print(response.body); // Print the response body for debugging
      try {
        List<dynamic> notesJson = jsonDecode(response.body);
        setState(() {
          filteredNotes = notesJson.map((json) => Note.fromJson(json)).toList();
        });
      } catch (e) {
        print('Error parsing JSON: $e'); // Print the error for debugging
      }
    } else {
      throw Exception('Failed to load notes');
    }
  }

  List<Note> sortNotesByModifiedTime(List<Note> notes) {
    if (sorted) {
      notes.sort((a, b) => a.modifiedTime.compareTo(b.modifiedTime));
    } else {
      notes.sort((b, a) => a.modifiedTime.compareTo(b.modifiedTime));
    }

    sorted = !sorted;

    return notes;
  }

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filteredNotes = filteredNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }
  //delete note
  Future<void> deleteNoteFromServer(int noteId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://192.168.201.48/api_clothes_store/todo/delete_note.php'),
        body: jsonEncode({'id': noteId}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Note deleted successfully');
      } else {
        print('Failed to delete note: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting note: $e');
    }
  }
  void deleteNoteLocally(int index) {
    setState(() {
      Note note = filteredNotes[index];
      filteredNotes.removeAt(index);
    });
  }
  void deleteNote(int index) async {
    Note note = filteredNotes[index];
    await deleteNoteFromServer(note.id);
    deleteNoteLocally(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 56, 18, 194),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tasks',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        filteredNotes = sortNotesByModifiedTime(filteredNotes);
                      });
                    },
                    padding: const EdgeInsets.all(0),
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 142, 157, 233).withOpacity(.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.sort,
                        color: Color.fromARGB(255, 41, 36, 36),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: onSearchTextChanged,
              style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 41, 36, 36)),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                hintText: "Search notes...",
                hintStyle: const TextStyle(color: Color.fromARGB(255, 41, 36, 36)),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 41, 36, 36),
                ),
                fillColor: const  Color.fromARGB(255, 142, 157, 233),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color:Color.fromARGB(255, 166, 169, 183)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 142, 157, 233)),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  color: getRandomColor(),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TodoEditScreen(note: filteredNotes[index]),
                          ),
                        );
                        if (result != null) {
                          setState(() {
                            Note editedNote = result as Note;
                            int originalIndex = filteredNotes.indexWhere((note) => note.id == editedNote.id);
                            filteredNotes[originalIndex] = editedNote;
                          });
                        }
                      },
                      title: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: '${filteredNotes[index].title} \n',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1.5),
                            children: [
                              TextSpan(
                                text: filteredNotes[index].content,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    height: 1.5),
                              )
                            ]),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Edited: ${DateFormat('EEE MMM d, yyyy h:mm a').format(filteredNotes[index].modifiedTime)}',
                          style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey.shade800),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          final result = await confirmDialog(context);
                          if (result != null && result) {
                            deleteNote(index);
                          }
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const TodoEditScreen(),
            ),
          );

          if (result != null) {
            setState(() {
              Note newNote = result as Note;
              filteredNotes.add(newNote);
            });
          }
        },
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 142, 157, 233),
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade900,
            icon: const Icon(
              Icons.info,
              color: Colors.blue,
              size: 80,
            ),
            title: const Text(
              'Are you sure?',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Do you want to delete this note?',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          );
        });
  }
}
