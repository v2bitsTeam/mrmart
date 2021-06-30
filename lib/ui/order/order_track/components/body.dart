import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:MrMart/app_components/StyleScheme.dart';
import 'package:MrMart/ui/order/track_your_location/track_your_location_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:MrMart/ui/message_2/message_screen2.dart';
import 'package:MrMart/ui_components/default_button.dart';
import 'package:MrMart/ui_components/CustomDialogReview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          orderTextDotedBoxWIdget(context),
          SizedBox(height: 16),
          callSmsLocationBtnWIdget(context),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: timeLineTileWidget(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DefaultButton(
              text: "Give Your feedback",
              press: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => CustomDialogReview());
                //Navigator.pushNamed(context, cart_summary_screen.routeName)
              },
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Column timeLineTileWidget() {
    return Column(
      children: <Widget>[
        Container(
          color: kBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                isFirst: true,
                indicatorStyle: IndicatorStyle(
                  width: 65,
                  height: 65,
                  color: kActiveOrderTrackBG1,
                  iconStyle: IconStyle(
                    color: kOrderTrack_icon1,
                    fontSize: 40,
                    iconData: Icons.shopping_cart,
                  ),
                ),
                endChild: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Order Placed.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                beforeLineStyle: const LineStyle(
                  color: kActiveOrderTrackLine,
                  thickness: 3,
                ),
              ),
              const TimelineDivider(
                begin: 0.1,
                end: 0.9,
                thickness: 3,
                color: kActiveOrderTrackLine,
              ),
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.9,
                indicatorStyle: IndicatorStyle(
                  width: 65,
                  height: 65,
                  color: kActiveOrderTrackBG2,
                  iconStyle: IconStyle(
                    color: kOrderTrack_icon2,
                    fontSize: 40,
                    iconData: Icons.wallet_giftcard,
                  ),
                ),
                beforeLineStyle: const LineStyle(
                  color: kActiveOrderTrackLine,
                  thickness: 3,
                ),
                afterLineStyle: const LineStyle(
                  color: kActiveOrderTrackLine,
                  thickness: 3,
                ),
                startChild: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 140),
                    child: Text(
                      'Order Packed.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
              const TimelineDivider(
                begin: 0.1,
                end: 0.9,
                color: kActiveOrderTrackLine,
                thickness: 3,
              ),
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                isFirst: false,
                indicatorStyle: IndicatorStyle(
                  width: 65,
                  height: 65,
                  color: kActiveOrderTrackBG3,
                  iconStyle: IconStyle(
                    color: kOrderTrack_icon3,
                    fontSize: 40,
                    iconData: Icons.directions_bus,
                  ),
                ),
                endChild: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Order picked by delivery man.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                beforeLineStyle: const LineStyle(
                  color: kActiveOrderTrackLine,
                  thickness: 3,
                ),
              ),
              const TimelineDivider(
                begin: 0.1,
                end: 0.9,
                thickness: 3,
                color: kActiveOrderTrackLine,
              ),
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.9,
                isLast: true,
                indicatorStyle: IndicatorStyle(
                  width: 65,
                  height: 65,
                  color: kActiveOrderTrackBG4,
                  iconStyle: IconStyle(
                    color: kOrderTrack_icon4,
                    fontSize: 40,
                    iconData: Icons.location_on_outlined,
                  ),
                ),
                beforeLineStyle: const LineStyle(
                  color: kActiveOrderTrackLine,
                  thickness: 3,
                ),
                afterLineStyle: const LineStyle(
                  color: kActiveOrderTrackLine,
                  thickness: 3,
                ),
                startChild: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 140),
                    child: Text(
                      'Order received.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding orderTextDotedBoxWIdget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        decoration: BoxDecoration(
          color: kItemBackgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(5),
          padding: EdgeInsets.all(kDefaultPadding),
          color: Colors.white,
          dashPattern: [2, 3],
          strokeWidth: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Order ID : #uV4500',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Colors.black),
                        )
                      ],
                    ),
                    Row(children: [
                      Text(
                        'Placed On : 20 june 2020, 05:30pm',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Colors.black),
                      ),
                    ]),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total Price : \u{20B9}1400',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Item : 2',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: Colors.black),
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
    );
  }

  Container callSmsLocationBtnWIdget(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Time : 2 Days",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    InkWell(
                      child: ShapeOfView(
                        height: 50,
                        width: 50,
                        elevation: 0,
                        shape: RoundRectShape(
                          borderRadius: BorderRadius.circular(5),
                          borderColor: Colors.black, //optional
                          borderWidth: 0, //optional
                        ),
                        child: Container(
                          color: kSwitchColor,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                                'assets/icons/track_your_location/call.svg',
                                color: Colors.white,
                                semanticsLabel: ''),
                          ),
                        ),
                      ),
                      onTap: () {
                        launch("tel://017123456789");
                        /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TrackYourLocationScreen()),
                            );*/
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // InkWell(
                    //   child: ShapeOfView(
                    //     height: 50,
                    //     width: 50,
                    //     elevation: 0,
                    //     shape: RoundRectShape(
                    //       borderRadius: BorderRadius.circular(5),
                    //       borderColor: Colors.black, //optional
                    //       borderWidth: 0, //optional
                    //     ),
                    //     child: Container(
                    //       color: kPrimaryColor2,
                    //       child: Padding(
                    //         padding: EdgeInsets.all(10.0),
                    //         child: SvgPicture.asset(
                    //             'assets/icons/track_your_location/sms.svg',
                    //             color: Colors.white,
                    //             semanticsLabel: ''),
                    //       ),
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => MessageScreen2()),
                    //     );
                    //   },
                    // ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    InkWell(
                      child: ShapeOfView(
                        height: 50,
                        width: 50,
                        elevation: 0,
                        shape: RoundRectShape(
                          borderRadius: BorderRadius.circular(5),
                          borderColor: Colors.black, //optional
                          borderWidth: 0, //optional
                        ),
                        child: Container(
                          color: kPrimaryColor2,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                                'assets/icons/track_your_location/location.svg',
                                color: Colors.white,
                                semanticsLabel: ''),
                          ),
                        ),
                      ),
                      onTap: () {
                        //Get.toNamed(TRACK_YOUR_LOCATION_SCREEN);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrackYourLocationScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //old widget
  Container statusWidget(String img, String status, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(50),
                padding: EdgeInsets.all(0),
                color: Colors.white,
                dashPattern: [2, 3],
                strokeWidth: 2,
                child: ShapeOfView(
                  height: 80,
                  width: 80,
                  elevation: 0,
                  shape: RoundRectShape(
                    borderRadius: BorderRadius.circular(50),
                    borderColor: Colors.black, //optional
                    borderWidth: 0, //optional
                  ),
                  child: Container(
                    color: (isActive)
                        ? kActiveOrderTrackBG1
                        : kInActiveOrderTrackBG,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SvgPicture.asset("assets/icons/order/$img.svg",
                          color: (isActive)
                              ? kOrderTrack_icon1
                              : kOrderTrack_InActive_icon,
                          semanticsLabel: ''),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                status,
                style: contentStyle.copyWith(
                    color: (isActive) ? kTextColor : kInActiveOrderTrackLine),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      (isActive) ? kActiveOrderTrackBG1 : kInActiveOrderTrackBG,
                  border: Border.all(
                      color:
                          (isActive) ? Colors.transparent : Colors.transparent,
                      width: 3),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 13, top: 50),
                width: 4,
                height: 15,
                color: (isActive)
                    ? kActiveOrderTrackLine
                    : kInActiveOrderTrackLine,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                height: 4,
                color: (isActive)
                    ? kActiveOrderTrackLine
                    : kInActiveOrderTrackLine,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*class Example10Horizontal extends StatelessWidget {
  const Example10Horizontal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Center(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 120),
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isFirst: true,
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.purple,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: Colors.purple,
                      thickness: 6,
                    ),
                  ),
                  const TimelineDivider(
                    axis: TimelineAxis.vertical,
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: Colors.purple,
                  ),
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.9,
                    beforeLineStyle: const LineStyle(
                      color: Colors.purple,
                      thickness: 6,
                    ),
                    afterLineStyle: const LineStyle(
                      color: Colors.deepOrange,
                      thickness: 6,
                    ),
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.cyan,
                    ),
                  ),
                  const TimelineDivider(
                    axis: TimelineAxis.vertical,
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: Colors.deepOrange,
                  ),
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isLast: true,
                    beforeLineStyle: const LineStyle(
                      color: Colors.deepOrange,
                      thickness: 6,
                    ),
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
