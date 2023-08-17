import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  final String text;
  final dynamic callback;

  const BlackButton({
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: callback,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          )),
    );
  }
}
