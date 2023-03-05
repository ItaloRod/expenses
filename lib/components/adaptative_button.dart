import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const AdaptativeButton(
      {required this.label, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !Platform.isAndroid
        ? CupertinoButton(
            onPressed: onPressed,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(label),
      )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                  color: Theme.of(context).textTheme.labelLarge?.color),
            ),
          );
  }
}
