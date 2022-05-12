import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../theme/font.dart';
import '../theme/style.dart';
import 'icon_button_filled.dart';

enum TransparentLeadingType {
  drawer,
  back,
}

class TransparentAppBar extends StatelessWidget with PreferredSizeWidget {
  const TransparentAppBar({
    required this.title,
    this.leadingType = TransparentLeadingType.back,
    this.actions = const [],
    Key? key,
  }) : super(key: key);

  final String title;
  final List<Widget> actions;
  final TransparentLeadingType leadingType;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
          color: colorScheme.onBackground,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Row(
          children: actions,
        ),
        SizedBox(
          width: MyStyle.generalBodyPadding.right,
        )
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
