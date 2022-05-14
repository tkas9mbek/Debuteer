import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../theme/font.dart';
import '../theme/styles.dart';
import 'icon_button_filled.dart';

enum TransparentLeadingType {
  drawer,
  back,
}

class TransparentAppBar extends StatelessWidget with PreferredSizeWidget {
  const TransparentAppBar({
    this.title = '',
    this.leadingType = TransparentLeadingType.back,
    this.actions = const [],
    Key? key,
  }) : super(key: key);

  final String title;
  final List<Widget> actions;
  final TransparentLeadingType leadingType;

  @override
  Widget build(BuildContext context) {
    Widget leading;

    switch (leadingType) {
      case TransparentLeadingType.drawer:
        leading = IconButtonFilled(
          icon: FontAwesomeIcons.bars,
          onTap: () => Scaffold.of(context).openDrawer(),
        );
        break;
      case TransparentLeadingType.back:
        leading = IconButtonFilled(
          icon: FontAwesomeIcons.chevronLeft,
          onTap: () => context.pop(),
        );
        break;
    }

    return AppBar(
      elevation: 0,
      leading: Center(child: leading),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title,
        style: MyFont.style(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Row(
          children: actions,
        ),
        SizedBox(
          width: Styles.generalBodyPadding.right,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}