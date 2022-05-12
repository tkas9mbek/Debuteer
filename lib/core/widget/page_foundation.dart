import 'package:flutter/material.dart';

import '../theme/style.dart';

class PageFoundation extends StatelessWidget {
  const PageFoundation({
    required this.body,
    this.unfocusOnTap = false,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.padding,
    Key? key,
  }) : super(key: key);

  final bool unfocusOnTap;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    Widget item = SafeArea(
      child: Scaffold(
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
        body: Padding(
          padding: padding ?? MyStyle.generalBodyPadding,
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
