import 'package:flutter/material.dart';
import '../app_components/constants.dart';

class DefaultCollectVoucherButton extends StatelessWidget {
  const DefaultCollectVoucherButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: double.infinity,
      //height: getProportionateScreenHeight(56),
      height: 25,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: kPrimaryColor2,
        onPressed: press,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            text,
            style: TextStyle(
              //fontSize: getProportionateScreenWidth(18),
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
