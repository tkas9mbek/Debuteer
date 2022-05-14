import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    required this.child,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onTap,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 40,
          ),
          child: child,
        ),
      );
}
