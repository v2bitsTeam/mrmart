import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_mart/Widgets/DynamicSIzeWidget.dart';

class DefaultDialog extends StatefulWidget {
  final Widget child;
  final String title;
  final bool isError;
  final Alignment alignment;
  final double width;
  final bool enableCloseButton;
  final bool enableHeading;

  DefaultDialog({
    @required this.child,
    @required this.title,
    this.isError = false,
    this.alignment = Alignment.center,
    this.width,
    this.enableCloseButton = false,
    this.enableHeading = true,
  });
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
            color: Themes.primary,
            child: Container(
              width: widget.width ?? Get.width * 0.9,
              color: Themes.white,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: Dimension.size10,
                    color: Themes.primary,
                    padding: EdgeInsets.zero,
                  ),
                  Visibility(
                    visible: widget.enableHeading,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: Dimension.padding + Dimension.size10,
                        right: Dimension.size20,
                        top: Dimension.padding,
                        bottom: Dimension.size10,
                      ),
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
                                  margin: EdgeInsets.only(top: Dimension.size5),
                                  height: Dimension.size5,
                                  width: titleWidth / 2,
                                  decoration: BoxDecoration(
                                    color: Themes.primary,
                                    borderRadius: BorderRadius.circular(
                                      Dimension.size5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: widget.enableCloseButton,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                height: Dimension.size30,
                                width: Dimension.size30,
                                decoration: BoxDecoration(
                                  color: Themes.white,
                                  borderRadius:
                                      BorderRadius.circular(Dimension.size8),
                                  border: Border.all(
                                    color: Themes.grey,
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Themes.primary,
                                  size: Dimension.size14,
                                ),
                              ),
                            ),
                          ),
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
