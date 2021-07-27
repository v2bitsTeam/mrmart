import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageFromNetwork extends StatefulWidget {
  final String url, placeholder;
  final double height;
  final Color color;

  ImageFromNetwork({
    this.url,
    this.placeholder = 'assets/images/add-image.png',
    @required this.height,
    this.color,
  });

  @override
  _ImageFromNetworkState createState() => _ImageFromNetworkState();
}

class _ImageFromNetworkState extends State<ImageFromNetwork> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
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
