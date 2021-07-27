import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VoucherSliverAppBar extends StatelessWidget {
  final String _title;

  const VoucherSliverAppBar(
    this._title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.red,
      expandedHeight: 200,
      pinned: true,
      floating: true,
      title: Text(_title),
      flexibleSpace: Container(
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/header.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/cart_white.svg'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/notification.svg'),
          ),
        ),
      ],
    );
  }
}
