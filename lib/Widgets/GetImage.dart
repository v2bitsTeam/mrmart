import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/Widgets/DefaultDialog.dart';
import 'package:mr_mart/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future getImage(BuildContext context) async {
  var source = await showDialog(
      context: context,
      builder: (context) {
        return DefaultDialog(
          title: language.choose,
          child: Container(
            padding: EdgeInsets.only(
              left: Dimension.padding,
              right: Dimension.padding,
              top: Dimension.padding,
            ),
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
                            height: Dimension.size40,
                            width: Dimension.size40,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Dimension.size5),
                            child: Text(
                              language.camera,
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
                            height: Dimension.size40,
                            width: Dimension.size40,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Dimension.size5),
                            child: Text(
                              language.gallery,
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
                    TextButton(
                      onPressed: () {
                        Get.back(result: null);
                      },
                      child: Text(
                        language.close,
                        style: TextStyle(
                            color: Themes.primary,
                            fontSize: Dimension.textSizeSmall,
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
    final pickedFile = await ImagePicker().pickImage(
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
