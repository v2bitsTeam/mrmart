import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularImageNetwork extends StatefulWidget {
  String url,placeholder;
  double size;
  var margin;
  CircularImageNetwork({this.url,this.placeholder='assets/images/add-image.png',this.size=double.infinity,this.margin});

  @override
  _CircularImageNetworkState createState() => _CircularImageNetworkState();
}

class _CircularImageNetworkState extends State<CircularImageNetwork> {
  var placeholder;

  @override
  void initState() {
    super.initState();
    placeholder = Image.asset(widget.placeholder) ;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
       elevation: 0,
       clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.size),
        ),
        margin: widget.margin,
       child: Container(
         height: widget.size,
         width: widget.size,
         child: CachedNetworkImage(
           imageUrl: widget.url != null ? widget.url : "",
           progressIndicatorBuilder: (context, url, downloadProgress) =>
           placeholder,
           errorWidget: (context, url, error) => placeholder,
         ),
       ),
    );
  }
}
