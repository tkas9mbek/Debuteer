import 'package:flutter/material.dart';

import '../theme/font.dart';

enum IconButtonFillType {
  shadow,
  surface,
}

class IconButtonFilled extends StatelessWidget {
  const IconButtonFilled({
    required this.icon,
    required this.onTap,
    this.fillType = IconButtonFillType.surface,
    this.superscript,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final void Function() onTap;
  final IconButtonFillType fillType;
  final String? superscript;

  @override
  Widget build(BuildContext context) {
    const size = 38.0;
    const borderRadius = BorderRadius.all(Radius.circular(15));
    final colorScheme = Theme.of(context).colorScheme;

    Color fillColor;
    Color iconColor;

    switch (fillType) {
      case IconButtonFillType.shadow:
        fillColor = const Color.fromARGB(75, 0, 0, 0);
        iconColor = Colors.white;
        break;
      case IconButtonFillType.surface:
        fillColor = colorScheme.surface;
        iconColor = colorScheme.onSurface;
        break;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: fillColor,
        ),
        child: Stack(
          children: [
            Center(
              child: Icon(
                icon,
                size: 18,
                color: iconColor,
              ),
            ),
            if (superscript != null)
              ...[
                Positioned(
                  top: 5,
                  right: 3,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Text(
                      superscript ?? '',
                      style: MyFont.style(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ]
          ],
        ),
      ),
    );
  }
}
