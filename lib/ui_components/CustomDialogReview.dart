import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:MrMart/ui/order/order_track/components/list_feedback_data.dart'
    as list_feedback_data;

class CustomDialogReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 0.0,
            ),
            margin: EdgeInsets.only(top: 13.0, right: 8.0),
            decoration: BoxDecoration(
                color: kBackgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: new Text(
                    "Add your feedback",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Container(
                  color: kBackgroundColor,
                  padding: const EdgeInsets.all(2),
                  child: list_feedback_data.getFeedBackListView(),
                ),
                /*InkWell(
                  child: Container(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0)),
                    ),
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.blue, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )*/
              ],
            ),
          ),
          Positioned(
            right: -2.0,
            top: -2.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 35,
                  width: 35,
                  child: Center(
                    child: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
