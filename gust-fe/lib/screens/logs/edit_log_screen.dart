import 'package:flutter/material.dart';

class EditLogScreen extends StatelessWidget {
  final int logId;
  const EditLogScreen({super.key, required this.logId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Log')),
      body: Center(child: Text('Edit log with ID: $logId')),
    );
  }
}