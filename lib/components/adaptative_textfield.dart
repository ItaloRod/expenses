import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onSubmitted;
  final String labelText;

  const AdaptativeTextField(
      {this.controller,
      this.keyboardType = TextInputType.text,
      required this.labelText,
      this.onSubmitted,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !Platform.isAndroid
        ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CupertinoTextField(
              controller: controller,
              placeholder: labelText,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
            ),
        )
        : TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText
            ),
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
          );
  }
}
