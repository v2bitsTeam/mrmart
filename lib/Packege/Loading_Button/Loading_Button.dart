import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

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

  const LoadingButton({
    Key key,
    this.child,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.decoration,
    this.loadingWidget,
    this.defaultStyle = true,
    this.radius,
    this.buttonDecoration = ButtonDecoration.Shadow,
    this.paddingEnable = true,
  }) : super(key: key);

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
                color: widget.backgroundColor ?? Themes.primary2,
                borderRadius: BorderRadius.circular(
                  widget.radius ?? Dimension.size2,
                ),
              )
            : BoxDecoration(
                color: widget.backgroundColor ?? Themes.primary2,
                borderRadius: BorderRadius.circular(
                  widget.radius ?? Dimension.size2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: Dimension.size16,
                    offset: Offset(
                      0,
                      Dimension.size8,
                    ),
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
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  widget.radius ?? Dimension.size8,
                ),
              ),
            ),
            onPressed: widget.isLoading ? null : widget.onPressed,
            child: AnimatedContainer(
              padding: widget.isLoading
                  ? EdgeInsets.all(10)
                  : widget.paddingEnable
                      ? EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                      : EdgeInsets.zero,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: widget.isLoading
                  ? decoration.copyWith(
                      borderRadius: BorderRadius.circular(100),
                    )
                  : decoration,
              child: widget.isLoading ? loadingWidget : widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
