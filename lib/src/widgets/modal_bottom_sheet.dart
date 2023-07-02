import 'package:flutter/material.dart';
import 'package:notes_app/src/models/note.dart';
import 'package:notes_app/src/screens/notes.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotesScreen()));

                    deleteNote(notes.length - 1);
                  });
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.delete,
                    size: 30,
                  ),
                  title: Text(
                    'Delete',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.share,
                  size: 30,
                ),
                title: Text('Share', style: TextStyle(fontSize: 24)),
              )
            ]),
      ),
    );
  }
}
