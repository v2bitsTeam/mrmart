import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/icons/track_your_location/bg_location_track.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
