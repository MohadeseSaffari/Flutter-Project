import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_page/note.dart';
import 'package:http/http.dart' as http;

class TodoEditScreen extends StatefulWidget {
  final Note? note;

  const TodoEditScreen({super.key, this.note});

  @override
  State<TodoEditScreen> createState() => _TodoEditScreenState();
}

class _TodoEditScreenState extends State<TodoEditScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController = TextEditingController(text: widget.note?.content ?? '');
  }

  Future<void> saveNote() async {
    final title = _titleController.text;
    final content = _contentController.text;
    final modifiedTime = DateTime.now();

    if (widget.note != null) {
      // Edit existing note
      Note editedNote = widget.note!.copyWith(
        title: title,
        content: content,
        modifiedTime: modifiedTime,
      );

      // Call API to update the note
      final response = await http.post(
        Uri.parse('http://192.168.201.48/api_clothes_store/todo/update_note.php'),
        body: editedNote.toJson(),
      );

      if (response.statusCode == 200) {
        Navigator.pop(context, editedNote);
      } else {
        // Handle error
      }
    } else {
      // Create new note
      final response = await http.post(
        Uri.parse('http://192.168.201.48/api_clothes_store/todo/create_note.php'),
        body: jsonEncode({
          'title': title,
          'content': content,
          'modified_time': modifiedTime.toIso8601String(),
        }),
      );

      if (response.statusCode == 200) {
        final newNoteData = jsonDecode(response.body);
        Note newNote = Note.fromJson(newNoteData);
        Navigator.pop(context, newNote);
      } else {
        // Handle error
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 56, 18, 194),
      appBar: AppBar(
        title: Text(widget.note != null ? 'Edit Note' : 'New Note'),
        backgroundColor: const Color.fromARGB(255, 142, 157, 233),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: const TextStyle(fontSize: 18, color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: const Color.fromARGB(255, 142, 157, 233).withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                style: const TextStyle(fontSize: 18, color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Content',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 142, 157, 233).withOpacity(0.5),
                ),
                maxLines: null,
                expands: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveNote,
        child: const Icon(Icons.save),
      ),
    );
  }
}
