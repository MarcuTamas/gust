import 'package:flutter/material.dart';

class StreakCard extends StatelessWidget {
  final int streak;
  final bool isLoading;

  const StreakCard({
    super.key,
    required this.streak,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.local_fire_department, color: Colors.red),
        title: isLoading
            ? const LinearProgressIndicator()
            : Text('Streak: $streak zile'),
        subtitle: const Text('Zile consecutive fără depășiri'),
      ),
    );
  }
}