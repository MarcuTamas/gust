import 'package:flutter/material.dart';

class DailySummaryCard extends StatelessWidget {
  final List<dynamic> logs;
  final bool isLoading;

  const DailySummaryCard({
    super.key,
    required this.logs,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    final totalSugar = logs.fold<int>(0, (sum, log) => sum + ((log.sugarGrams ?? 0) as int));

    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text('Total sugar today: $totalSugar g'),
        subtitle: Text('Logs: ${logs.length}'),
      ),
    );
  }
}