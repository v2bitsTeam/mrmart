import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/constants.dart';

class TitleWithClearAllBtn extends StatelessWidget {
  const TitleWithClearAllBtn({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
                fontSize: kDefaultFontSize, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          TextButton(
            onPressed: press,
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(0),
            ),
            child: Text(
              "Clear All",
              textDirection: TextDirection.rtl,
              style: TextStyle(color: kClearAll, fontSize: kDefaultFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
