import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/src/models/note.dart';
import 'package:notes_app/src/screens/screens.dart';
import 'package:notes_app/src/utils/app_colors.dart';

class NotePreview extends StatefulWidget {
  final Note note;
  final int index;

  const NotePreview({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  @override
  State<NotePreview> createState() => _NotePreviewState();
}

class _NotePreviewState extends State<NotePreview> {
  generateColor() {
    Random random = Random();

    int randomIndex = random.nextInt(appColors.length);

    Color color = appColors[randomIndex];

    // appColors.remove(color);

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NoteDetail(note: widget.note, index: widget.index)),
          );
        },
        child: Card(
            color: generateColor(),
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.note.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                          width: 280,
                          child: RichText(
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: widget.note.body,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'inter',
                                      fontSize: 18)))))
                ],
              ),
            )),
      ),
      Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NoteDetail(note: widget.note, index: widget.index)),
              );
            },
          ))
    ]);
  }
}
