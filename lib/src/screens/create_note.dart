import 'package:flutter/material.dart';
import 'package:notes_app/src/models/note.dart';
import 'package:notes_app/src/screens/screens.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.delete,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const FormattingToolBar(),
                  TextField(
                    controller: _titleController,
                    cursorColor: Colors.black,
                    maxLines: null,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  TextField(
                    controller: _noteController,
                    cursorColor: Colors.black,
                    maxLines: null,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Body',
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NotesScreen()));
              setState(() {
                notes.add(Note(_titleController.text, _noteController.text));
              });
            }));
  }
}
