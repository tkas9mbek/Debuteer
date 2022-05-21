import 'package:flutter/material.dart';

import '../../../core/theme/styles.dart';

class MoveContainer extends StatelessWidget {
  const MoveContainer({
    required this.san,
    Key? key,
  }) : super(key: key);

  final List<String?> san;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      children: san
          .map(
            (e) => Container(
              margin: const EdgeInsets.only(
                right: 10,
                bottom: 13,
              ),
              decoration: BoxDecoration(
                borderRadius: Styles.cardGeneralRadius,
                color: colorScheme.primaryContainer,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 13,
              ),
              child: Text(
                e ?? '',
              ),
            ),
          )
          .toList(),
    );
  }
}
