import 'package:flutter/material.dart';

import '../theme/font.dart';

class TitledWidget extends StatelessWidget {
  const TitledWidget({
    required this.child,
    required this.title,
    this.required = false,
    this.style,
    Key? key,
  }) : super(key: key);

  final bool required;
  final String title;
  final Widget child;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: style ?? MyFont.style(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimary,
              ),
            ),
            if (required) ...[
              const SizedBox(
                width: 5,
              ),
              Text(
                '*',
                style: MyFont.style(
                  color: colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        child,
      ],
    );
  }
}
