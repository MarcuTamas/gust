import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/sugar_log_provider.dart';
import '../../widgets/loading_button.dart';

class LogsScreen extends ConsumerWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sugarLogState = ref.watch(sugarLogProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sugar Logs'),
      ),
      body: sugarLogState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : sugarLogState.error != null
              ? Center(child: Text(sugarLogState.error!))
              : ListView.builder(
                  itemCount: sugarLogState.logs.length,
                  itemBuilder: (context, index) {
                    final log = sugarLogState.logs[index];
                    return ListTile(
                      title: Text(log.productName),
                      subtitle: Text('${log.sugarGrams}g sugar on ${log.date}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => context.go('/edit-log/${log.id}'),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add-log'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
