import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class SecondCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondCustomButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Color.fromRGBO(73, 25, 133, 1),
            fontSize: 17,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: secondaryButtonColor,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
        ),
      ),
    );
  }
}
