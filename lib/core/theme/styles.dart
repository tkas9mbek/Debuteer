import 'package:flutter/material.dart';

class Styles {
  static EdgeInsets generalBodyPadding = const EdgeInsets.only(
    top: 20,
    left: 25,
    right: 25,
    bottom: 25,
  );

  static BorderRadius cardGeneralRadius = BorderRadius.circular(10);

  static BorderRadius formBorderRadius = BorderRadius.circular(10);

  static EdgeInsets formPadding = const EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 15,
  );

  static InputDecoration formInputDecoration(
      BuildContext context, {
        String? hintText,
        String? prefixText,
        String? labelText,
        Widget? prefixIcon,
        BoxConstraints? prefixIconConstraints,
      }) {
    final colorScheme = Theme.of(context).colorScheme;

    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixText: prefixText,
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIconConstraints,
      filled: true,
      isDense: true,
      fillColor: colorScheme.surface,
      contentPadding: formPadding,
      focusedBorder: OutlineInputBorder(
        borderRadius: formBorderRadius,
        borderSide: BorderSide(
          width: 1,
          color: colorScheme.surface,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: formBorderRadius,
        borderSide: BorderSide(
          width: 1,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}
