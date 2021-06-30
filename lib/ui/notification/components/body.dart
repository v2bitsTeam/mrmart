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
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headline1,
              ),
              InkWell(
                child: Text(
                  "Clear All",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: kClearAll,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.20,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/images/notification/notification_food1.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Giant Food Stores.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('9.00am',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    'Sed quis pretium mauris  massa amet tempus ullamcorper.',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Card(
                child: IconSlideAction(
                  //caption: 'Archive',
                  color: Colors.blue,
                  icon: Icons.archive,
                  onTap: () {},
                ),
              ),
              /*IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
                onTap: () {},
              ),*/
            ],
            secondaryActions: <Widget>[
              /*IconSlideAction(
                caption: 'More',
                color: Colors.black45,
                icon: Icons.more_horiz,
                onTap: () {},
              ),*/
              Card(
                child: IconSlideAction(
                  //caption: 'Delete',
                  color: kClearAll,
                  icon: Icons.delete_forever,
                  onTap: () {},
                ),
              ),
            ],
          ),
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.20,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/images/notification/notification_food3.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Giant Food Stores.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('7.10am',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    'Sed quis pretium mauris  massa amet tempus ullamcorper.',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Card(
                child: IconSlideAction(
                  //caption: 'Archive',
                  color: Colors.blue,
                  icon: Icons.archive,
                  onTap: () {},
                ),
              ),
              /*IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
                onTap: () {},
              ),*/
            ],
            secondaryActions: <Widget>[
              /*IconSlideAction(
                caption: 'More',
                color: Colors.black45,
                icon: Icons.more_horiz,
                onTap: () {},
              ),*/
              Card(
                child: IconSlideAction(
                  //caption: 'Delete',
                  color: kClearAll,
                  icon: Icons.delete_forever,
                  onTap: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Yesterday',
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headline1,
              ),
              InkWell(
                child: Text(
                  "Clear All",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: kClearAll,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.20,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/images/notification/notification_food4.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Giant Food Stores.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('6.45am',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    'Sed quis pretium mauris  massa amet tempus ullamcorper.',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Card(
                child: IconSlideAction(
                  //caption: 'Archive',
                  color: Colors.blue,
                  icon: Icons.archive,
                  onTap: () {},
                ),
              ),
              /*IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
                onTap: () {},
              ),*/
            ],
            secondaryActions: <Widget>[
              /*IconSlideAction(
                caption: 'More',
                color: Colors.black45,
                icon: Icons.more_horiz,
                onTap: () {},
              ),*/
              Card(
                child: IconSlideAction(
                  //caption: 'Delete',
                  color: kClearAll,
                  icon: Icons.delete_forever,
                  onTap: () {},
                ),
              ),
            ],
          ),
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.20,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/images/notification/notification_food5.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Giant Food Stores.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('12.00am',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    'Sed quis pretium mauris  massa amet tempus ullamcorper.',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Card(
                child: IconSlideAction(
                  //caption: 'Archive',
                  color: Colors.blue,
                  icon: Icons.archive,
                  onTap: () {},
                ),
              ),
              /*IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
                onTap: () {},
              ),*/
            ],
            secondaryActions: <Widget>[
              /*IconSlideAction(
                caption: 'More',
                color: Colors.black45,
                icon: Icons.more_horiz,
                onTap: () {},
              ),*/
              Card(
                child: IconSlideAction(
                  //caption: 'Delete',
                  color: kClearAll,
                  icon: Icons.delete_forever,
                  onTap: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '10 March 2020',
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headline1,
              ),
              InkWell(
                child: Text(
                  "Clear All",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: kClearAll,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.20,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/images/notification/notification_food6.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Giant Food Stores.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('11.00pm',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    'Sed quis pretium mauris  massa amet tempus ullamcorper.',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Card(
                child: IconSlideAction(
                  //caption: 'Archive',
                  color: Colors.blue,
                  icon: Icons.archive,
                  onTap: () {},
                ),
              ),
              /*IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
                onTap: () {},
              ),*/
            ],
            secondaryActions: <Widget>[
              /*IconSlideAction(
                caption: 'More',
                color: Colors.black45,
                icon: Icons.more_horiz,
                onTap: () {},
              ),*/
              Card(
                child: IconSlideAction(
                  //caption: 'Delete',
                  color: kClearAll,
                  icon: Icons.delete_forever,
                  onTap: () {},
                ),
              ),
            ],
          ),
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.20,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/images/notification/notification_food4.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Giant Food Stores.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('3.56pm',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    'Sed quis pretium mauris  massa amet tempus ullamcorper.',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Card(
                child: IconSlideAction(
                  //caption: 'Archive',
                  color: Colors.blue,
                  icon: Icons.archive,
                  onTap: () {},
                ),
              ),
              /*IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
                onTap: () {},
              ),*/
            ],
            secondaryActions: <Widget>[
              /*IconSlideAction(
                caption: 'More',
                color: Colors.black45,
                icon: Icons.more_horiz,
                onTap: () {},
              ),*/
              Card(
                child: IconSlideAction(
                  //caption: 'Delete',
                  color: kClearAll,
                  icon: Icons.delete_forever,
                  onTap: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
