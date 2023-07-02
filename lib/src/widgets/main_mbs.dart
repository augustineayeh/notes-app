import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/src/screens/screens.dart';

class MainMBS extends StatelessWidget {
  const MainMBS({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(children: <Widget>[
        Align(
          alignment: const Alignment(0.9, 0),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: const Icon(
                Icons.close,
                size: 25,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Functionality(
                imageUrl: 'assets/images/twitter.png', label: 'Tweet'),
            Functionality(
                imageUrl: 'assets/images/search.png', label: 'Search'),
            Functionality(
                imageUrl: 'assets/images/settings.png', label: 'Settings'),
            Functionality(imageUrl: 'assets/images/shared.png', label: 'Share')
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            child: const Text('Log out', style: TextStyle(fontSize: 25)))
      ]),
    );
  }
}
