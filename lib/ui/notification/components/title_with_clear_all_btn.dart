import 'package:flutter/material.dart';
import 'package:MrMart/app_components/constants.dart';

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
          //TitleWithCustomUnderline(text: title),
          Text(
            text,
            style: TextStyle(
                fontSize: kDefaultFontSize, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          FlatButton(
            onPressed: press,
            padding: EdgeInsets.all(0),
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

/*class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: kDefaultFontSize, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}*/
