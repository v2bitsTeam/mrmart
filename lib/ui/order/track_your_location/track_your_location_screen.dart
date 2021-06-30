import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:MrMart/ui/order/track_your_location/components/body.dart';

class TrackYourLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Your Location"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/header.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*Container(
                child: Image.asset(
                  'assets/images/checkout/checkout_header_image.png',
                  fit: BoxFit.fill,
                ),
              ),*/
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/icons/track_your_location/bg_location_track.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
