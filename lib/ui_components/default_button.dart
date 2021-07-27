import 'package:flutter/material.dart';
import '../app_components/constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function press;

  const DefaultButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: color,
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
