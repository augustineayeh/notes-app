import 'package:flutter/material.dart';
import 'package:notes_app/src/models/note.dart';
import 'package:notes_app/src/screens/screens.dart';

export 'package:notes_app/src/widgets/widgets.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'My notes',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return const MainMBS();
                        },
                      );
                    },
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: 'Favourites'),
                    Button(text: 'Today'),
                    Button(text: 'This week'),
                    Button(text: "Last 30 days"),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        int reversedIndex = notes.length - 1 - index;
                        final note = notes[reversedIndex];
                        return NotePreview(
                          note: note,
                          index: index,
                        );
                      }),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateNote()),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 32,
            )));
  }
}
