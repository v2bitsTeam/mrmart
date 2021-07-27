import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/main.dart';

class KeyboardHandler extends StatelessWidget {
  final Widget child;
  final KeyboardActionsConfig config;

  KeyboardHandler({this.child, this.config});

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      tapOutsideBehavior: TapOutsideBehavior.none,
      autoScroll: false,
      overscroll: 0,
      config: config,
      child: child,
    );
  }
}

class CustomActions extends StatelessWidget implements PreferredSizeWidget {
  final FocusNode node;

  const CustomActions({
    Key key,
    this.node,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Themes.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => node.unfocus(),
            child: Text(
              language.done,
              style: TextStyle(
                color: Themes.primary,
                fontSize: Dimension.textSize,
                fontWeight: Dimension.textMedium,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}

KeyboardActionsItem textFieldAction({FocusNode focusNode}) {
  return KeyboardActionsItem(
    focusNode: focusNode,
    displayArrows: false, //for next and back button
    displayActionBar: false, //for done button
    footerBuilder: (context) {
      return CustomActions(
        node: focusNode,
      );
    },
  );
}
