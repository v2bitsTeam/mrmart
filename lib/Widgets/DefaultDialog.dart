import 'dart:ffi';

import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/Widgets/DynamicSIzeWidget.dart';

import '../main.dart';

class DefaultDialog extends StatefulWidget {
  Widget child;
  String title;
  bool isError;
  Alignment alignment;
  double width;
  bool enableCloseButton;
  bool enableHeading;

  DefaultDialog(
      {@required this.child,
      @required this.title,
      this.isError = false,
      this.alignment = Alignment.center,
      this.width,
      this.enableCloseButton = false,
      this.enableHeading = true});
  @override
  _DefaultDialogState createState() =>
      _DefaultDialogState(child: child, title: title, isError: isError);
}

class _DefaultDialogState extends State<DefaultDialog> {
  Widget child;
  String title;
  bool isError;
  double titleWidth = Get.width * 0.2;

  _DefaultDialogState(
      {@required this.child, @required this.title, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: widget.alignment,
        child: Material(
          color: Colors.transparent,
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(0),
            elevation: 0,
            color: Themes.Primary,
            child: Container(
              width: widget.width ?? Get.width * 0.9,
              color: Themes.White,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: ListView(
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: Dimension.Size_10,
                    color: Themes.Primary,
                    padding: EdgeInsets.zero,
                  ),
                  Visibility(
                    visible: widget.enableHeading,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: Dimension.Padding + Dimension.Size_10,
                          right: Dimension.Size_20,
                          top: Dimension.Padding,
                          bottom: Dimension.Size_10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DynamicSizeWidget(
                                    onGetSize: (height, width) {
                                      titleWidth = width;
                                      setState(() {});
                                    },
                                    child: Text(
                                      title,
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    )),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: Dimension.Size_5),
                                  height: Dimension.Size_5,
                                  width: titleWidth / 2,
                                  decoration: BoxDecoration(
                                      color: Themes.Primary,
                                      borderRadius: BorderRadius.circular(
                                          Dimension.Size_5)),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                              visible: widget.enableCloseButton,
                              child: GestureDetector(
                                onTap: () => Get.back(),
                                child: Container(
                                  height: Dimension.Size_30,
                                  width: Dimension.Size_30,
                                  decoration: BoxDecoration(
                                      color: Themes.White,
                                      borderRadius: BorderRadius.circular(
                                          Dimension.Size_8),
                                      border: Border.all(
                                          color: Themes.Grey, width: 1)),
                                  child: Icon(
                                    Icons.close,
                                    color: Themes.Primary,
                                    size: Dimension.Size_14,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  child
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
class DefaultDialog extends StatelessWidget {

  Widget child;
  String title;
  bool isError;

  DefaultDialog({@required this.child,@required this.title,this.isError=false});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Stack(
        overflow: Overflow.visible,
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              margin: EdgeInsets.all(0),
              elevation: 0,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 30),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: Dimension.Padding,right: Dimension.Padding,bottom: 10),
                    child: Text(title,style: TextStyle(color: isError ? Colors.redAccent:Themes.Text_Color,fontSize: Dimension.Text_Size_Big,fontWeight: FontWeight.bold ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  ),
                  child
                ],
              ),
            ),
          Positioned(
            top: -30,
            child: Container(
              height: 60,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(width: 2,color: Themes.Primary)
              ),
              child: Image.asset('assets/images/logo_transparent.png',height: 40,width: 40),
            ),
          )
        ],
      ),
    );
  }
}
*/
