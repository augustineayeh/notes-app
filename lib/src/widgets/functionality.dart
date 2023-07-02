import 'package:flutter/material.dart';

class Functionality extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String? callback;

  const Functionality({
    Key? key,
    required this.imageUrl,
    required this.label,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback;
      },
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            height: 30,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
