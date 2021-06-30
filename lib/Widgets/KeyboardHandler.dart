import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/main.dart';

class KeyboardHandler extends StatelessWidget {
  Widget child;
  KeyboardActionsConfig config;

  KeyboardHandler({this.child, this.config});

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      tapOutsideToDismiss: false,
      autoScroll: false,
      //enable: false,
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
      color: Themes.White,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            onPressed: () => node.unfocus(),
            child: Text(
              language.Done,
              style: TextStyle(
                  color: Themes.Primary,
                  fontSize: Dimension.Text_Size,
                  fontWeight: Dimension.textMedium),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}

KeyboardActionsItem TextFieldAction({FocusNode focusNode}) {
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
