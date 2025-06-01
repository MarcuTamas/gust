import 'package:flutter/material.dart';

class QuickAddButton extends StatelessWidget {
  final VoidCallback onPressed;
  const QuickAddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Quick Add',
      child: const Icon(Icons.add),
    );
  }
}