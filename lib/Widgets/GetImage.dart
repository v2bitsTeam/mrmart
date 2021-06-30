import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/Widgets/DefaultDialog.dart';
import 'package:MrMart/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

Future getImage(BuildContext context) async {
  var source = await showDialog(
      context: context,
      builder: (context) {
        return DefaultDialog(
          title: language.Choose,
          child: Container(
            padding: EdgeInsets.only(
                left: Dimension.Padding,
                right: Dimension.Padding,
                top: Dimension.Padding),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back(result: ImageSource.camera);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/camera.png',
                            height: Dimension.Size_40,
                            width: Dimension.Size_40,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Dimension.Size_5),
                            child: Text(
                              language.Camera,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.1,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back(result: ImageSource.gallery);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/gallery.png',
                            height: Dimension.Size_40,
                            width: Dimension.Size_40,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Dimension.Size_5),
                            child: Text(
                              language.Gallery,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Get.back(result: null);
                      },
                      child: Text(
                        language.Close,
                        style: TextStyle(
                            color: Themes.Primary,
                            fontSize: Dimension.Text_Size_Small,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
  if (source != null) {
    final pickedFile = await ImagePicker().getImage(
      source: source,
    );
    try {
      if (pickedFile != null) {
        return pickedFile;
      } else
        return null;
    } catch (e) {
      return null;
    }
  } else
    return null;
}
