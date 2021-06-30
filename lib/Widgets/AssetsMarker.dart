import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:path_provider/path_provider.dart';

Future<BitmapDescriptor> AssetsMarker({
  String imagePath,
  Size size,
  Color color,
}) async {
  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);

  final Radius radius = Radius.circular(5);
  final Radius square = Radius.circular(0);

  /*final Paint tagPaint = Paint()..color = Colors.blue;
  final double tagWidth = 40.0;*/

  final Paint shadowPaint = Paint()
    ..color = color == null ? Colors.transparent : color;
  final double shadowWidth = 15.0;
  Rect oval;

  //final Paint borderPaint = Paint()..color = Colors.white;
  final double borderWidth = 3.0;

  final double imageOffset = shadowWidth + borderWidth;

  // Add shadow circle
  if (color != null) {
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        shadowPaint);
    oval = Rect.fromLTWH(imageOffset, imageOffset,
        size.width - (imageOffset * 2), size.height - (imageOffset * 2));
  } else {
    oval = Rect.fromLTWH(0, 0, size.width, size.height);
  }
  // Add image
  ui.Image image = await getImageFromPath(
      imagePath); // Alternatively use your own method to get the image
  paintImage(
    canvas: canvas,
    image: image,
    rect: oval, /*fit: BoxFit.fitWidth*/
  );

  // Convert canvas to image
  final ui.Image markerAsImage = await pictureRecorder
      .endRecording()
      .toImage(size.width.toInt(), size.height.toInt());

  // Convert image to bytes
  final ByteData byteData =
      await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List uint8List = byteData.buffer.asUint8List();

  return BitmapDescriptor.fromBytes(uint8List);
}

Future<ui.Image> getImageFromPath(String imagePath) async {
  File imageFile = await getImageFileFromAssets(imagePath);

  Uint8List imageBytes = imageFile.readAsBytesSync();

  final Completer<ui.Image> completer = new Completer();

  ui.decodeImageFromList(imageBytes, (ui.Image img) {
    return completer.complete(img);
  });

  return completer.future;
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load(path);
  final file =
      File('${(await getTemporaryDirectory()).path}/${DateTime.now()}.jpg');
  print(file.path);
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}
