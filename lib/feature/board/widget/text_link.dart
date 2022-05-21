import 'package:flutter/material.dart';

import '../../../core/theme/font.dart';

class TextLink extends StatelessWidget {
  const TextLink({
    required this.text,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(7.5),
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            text,
            style: MyFont.link(context),
          ),
        ),
      );
}
