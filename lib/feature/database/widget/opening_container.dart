import 'package:flutter/material.dart';

import '../../../core/theme/font.dart';
import '../../../core/theme/styles.dart';

class OpeningContainer extends StatelessWidget {
  const OpeningContainer({
    required this.name,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: Styles.cardGeneralRadius,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: Styles.cardGeneralRadius,
          color: colorScheme.primaryContainer,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: MyFont.style(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
