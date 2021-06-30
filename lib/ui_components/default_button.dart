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
      //height: getProportionateScreenHeight(56),
      height: 56,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: color,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            //fontSize: getProportionateScreenWidth(18),
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
