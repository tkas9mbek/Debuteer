import 'package:flutter/material.dart';

import '../theme/font.dart';
import '../theme/styles.dart';

class ShadowButton extends StatelessWidget {
  const ShadowButton({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    const size = 42.0;
    const fillColor = Color.fromARGB(75, 0, 0, 0);

    return InkWell(
      onTap: onTap,
      borderRadius: Styles.cardGeneralRadius,
      child: Container(
        height: size,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: Styles.cardGeneralRadius,
          color: fillColor,
        ),
        child: Center(
          child: Text(
            text,
            style: MyFont.style(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
