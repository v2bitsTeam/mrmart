import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

enum ButtonDecoration { Shadow, Flat }

class LoadingButton extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final void Function() onPressed;
  final Color backgroundColor;
  final BoxDecoration decoration;
  final Widget loadingWidget;
  final bool defaultStyle;
  final ButtonDecoration buttonDecoration;
  final double radius;
  final paddingEnable;

  const LoadingButton(
      {Key key,
      this.child,
      this.onPressed,
      this.isLoading = false,
      this.backgroundColor,
      this.decoration,
      this.loadingWidget,
      this.defaultStyle = true,
      this.radius,
      this.buttonDecoration = ButtonDecoration.Shadow,
      this.paddingEnable = true})
      : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  BoxDecoration decoration;
  Widget loadingWidget;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    buildDecoration();
    buildLoadingWidget();
  }

  void buildDecoration() {
    decoration = widget.decoration != null
        ? widget.decoration
        : widget.buttonDecoration == ButtonDecoration.Flat
            ? BoxDecoration(
                color: widget.backgroundColor ?? Themes.Primary2,
                borderRadius:
                    BorderRadius.circular(widget.radius ?? Dimension.Size_2),
              )
            : BoxDecoration(
                color: widget.backgroundColor ?? Themes.Primary2,
                borderRadius:
                    BorderRadius.circular(widget.radius ?? Dimension.Size_2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: Dimension.Size_16,
                    offset: Offset(
                        0, Dimension.Size_8), // changes position of shadow
                  ),
                ],
              );
  }

  void buildLoadingWidget() {
    loadingWidget = widget.loadingWidget ??
        SizedBox(
          width: widget.defaultStyle ? 25 : 10,
          height: 25,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    buildDecoration();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: FlatButton(
            onPressed: widget.isLoading ? null : widget.onPressed,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(widget.radius ?? Dimension.Size_8)),
            child: AnimatedContainer(
              padding: widget.isLoading
                  ? EdgeInsets.all(10)
                  : widget.paddingEnable
                      ? EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                      : EdgeInsets.zero,
              //padding: widget.isLoading ? EdgeInsets.only(left: 10,right: 10) : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: widget.isLoading
                  ? decoration.copyWith(
                      borderRadius: BorderRadius.circular(100))
                  : decoration,
              child: widget.isLoading ? loadingWidget : widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
