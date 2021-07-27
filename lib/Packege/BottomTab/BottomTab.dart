import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTab extends StatelessWidget {
  /// A bottom bar that faithfully follows the design by Aurélien Salomon
  ///
  /// https://dribbble.com/shots/5925052-Google-Bottom-Bar-Navigation-Pattern/
  BottomTab({
    Key key,
    @required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.margin = const EdgeInsets.all(8),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
  }) : super(key: key);

  /// A list of tabs to display, ie `Home`, `Likes`, etc
  final List<BottomTabItem> items;

  /// The tab to display.
  final int currentIndex;

  /// Returns the index of the tab that was tapped.
  final Function(int) onTap;

  /// The color of the icon and text when the item is selected.
  final Color selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color unselectedItemColor;

  /// A convenience field for the margin surrounding the entire widget.
  final EdgeInsets margin;

  /// The padding of each item.
  final EdgeInsets itemPadding;

  /// The transition duration
  final Duration duration;

  /// The transition curve
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (final item in items)
            TweenAnimationBuilder<double>(
              tween: Tween(
                end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
              ),
              curve: curve,
              duration: duration,
              builder: (context, t, _) {
                final _selectedColor = item.selectedColor ??
                    selectedItemColor ??
                    theme.primaryColor;

                return Material(
                  color: Color.lerp(_selectedColor.withOpacity(0.0),
                      _selectedColor.withOpacity(0.1), t),
                  shape: StadiumBorder(),
                  child: InkWell(
                    onTap: () => onTap?.call(items.indexOf(item)),
                    customBorder: StadiumBorder(),
                    focusColor: _selectedColor.withOpacity(0.1),
                    highlightColor: _selectedColor.withOpacity(0.1),
                    splashColor: _selectedColor.withOpacity(0.1),
                    hoverColor: _selectedColor.withOpacity(0.1),
                    child: Padding(
                      padding: itemPadding -
                          EdgeInsets.only(right: itemPadding.right * t),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              item.icon ?? SizedBox.shrink(),
                              ClipRect(
                                child: Align(
                                  alignment: Alignment.center,
                                  widthFactor: t,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: itemPadding.right / 2,
                                        right: itemPadding.right),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                        color: Color.lerp(
                                          _selectedColor.withOpacity(0.0),
                                          _selectedColor,
                                          t,
                                        ),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      child: item.title ?? SizedBox.shrink(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

/// A tab to display in a [BottomTab]
class BottomTabItem {
  /// An icon to display.
  final Widget icon;

  /// Text to display, ie `Home`
  final Widget title;

  /// A primary color to use for this tab.
  final Color selectedColor;

  /// The color to display when this tab is not selected.
  final Color unselectedColor;

  BottomTabItem({
    @required this.icon,
    @required this.title,
    this.selectedColor,
    this.unselectedColor,
  })  : assert(icon != null, "Every SalomonBottomBarItem requires an icon."),
        assert(title != null, "Every SalomonBottomBarItem requires a title.");
}
