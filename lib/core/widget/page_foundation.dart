import 'package:flutter/material.dart';

import '../../feature/drawer/the_drawer.dart';

class PageFoundation extends StatelessWidget {
  const PageFoundation({
    required this.body,
    this.unfocusOnTap = false,
    this.hasDrawer = false,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.padding,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final bool unfocusOnTap;
  final bool hasDrawer;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    Widget item = SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        drawer: hasDrawer ? const TheDrawer() : null,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
        body: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: body,
        ),
      ),
    );

    if (unfocusOnTap) {
      item = GestureDetector(
        onTap: () {
          final currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: item,
      );
    }

    return item;
  }
}
