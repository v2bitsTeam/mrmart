import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/main.dart';

class ImageFromNetwork extends StatefulWidget {
  String url, placeholder;
  double height;
  Color color;
  ImageFromNetwork(
      {this.url,
      this.placeholder = 'assets/images/add-image.png',
      @required this.height,
      this.color});

  @override
  _ImageFromNetworkState createState() => _ImageFromNetworkState();
}

class _ImageFromNetworkState extends State<ImageFromNetwork> {
  bool _loaded = false;
  var placeholder;

  @override
  void initState() {
    super.initState();
    placeholder = widget.color != null
        ? Image.asset(
            widget.placeholder,
            color: widget.color,
          )
        : Image.asset(widget.placeholder);
    /*placeholder=Container(
      height: widget.height,
      color: Themes.White,
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      //width: widget.size.width,
      child: CachedNetworkImage(
        imageUrl: widget.url != null ? widget.url : "",
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            placeholder,
        errorWidget: (context, url, error) => placeholder,
      ),
    );
  }
}
