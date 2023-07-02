import 'package:flutter/material.dart';
import 'package:notes_app/src/models/note.dart';
import 'package:notes_app/src/screens/screens.dart';

class NoteDetail extends StatefulWidget {
  final Note note;
  final int index;

  const NoteDetail({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(
                Icons.more_horiz,
                size: 30,
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return const ModalBottomSheet();
                  },
                );
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            const FormattingToolBar(),
            TextField(
              controller: TextEditingController(text: widget.note.title),
              cursorColor: Colors.black,
              maxLines: null,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: TextEditingController(text: widget.note.body),
              cursorColor: Colors.black,
              maxLines: null,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                hintText: 'Body',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                border: InputBorder.none,
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.save, color: Colors.white),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NotesScreen()));
          setState(() {
            deleteNote(notes.length - 1);
            notes.add(Note(widget.note.title, widget.note.body));
          });
        },
      ),
    );
  }
}
