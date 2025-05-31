import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/sugar_log_provider.dart';
import '../../models/emotion.dart';

class LogsScreen extends ConsumerStatefulWidget {
  const LogsScreen({super.key});

  @override
  ConsumerState<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends ConsumerState<LogsScreen> {
  final ScrollController _scrollController = ScrollController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sugarLogProvider.notifier).loadLogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final sugarLogState = ref.watch(sugarLogProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log-uri Zahăr'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _selectDate,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              if (_selectedDate != null) {
                ref.read(sugarLogProvider.notifier).loadLogsByDate(
                  DateFormat('yyyy-MM-dd').format(_selectedDate!),
                );
              } else {
                ref.read(sugarLogProvider.notifier).loadLogs();
              }
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          if (_selectedDate != null) {
            ref.read(sugarLogProvider.notifier).loadLogsByDate(
              DateFormat('yyyy-MM-dd').format(_selectedDate!),
            );
          } else {
            ref.read(sugarLogProvider.notifier).loadLogs();
          }
        },
        child: Column(
          children: [
            if (_selectedDate != null)
              Container(
                width: double.infinity,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(
                      'Filtrare: ${DateFormat('dd MMM yyyy', 'ro').format(_selectedDate!)}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedDate = null;
                        });
                        ref.read(sugarLogProvider.notifier).loadLogs();
                      },
                      child: const Text('Șterge filtrul'),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: sugarLogState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : sugarLogState.logs.isEmpty
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.local_cafe, size: 64, color: Colors.grey),
                              SizedBox(height: 16),
                              Text('Nu există log-uri de zahăr'),
                              SizedBox(height: 8),
                              Text('Apasă + pentru a adăuga primul log'),
                            ],
                          ),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(16),
                          itemCount: sugarLogState.logs.length,
                          itemBuilder: (context, index) {
                            final log = sugarLogState.logs[index];
                            final emotion = Emotion.fromString(log.emotion);
                            
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: emotion.color,
                                  child: Icon(
                                    emotion.icon,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(log.productName),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${log.sugarGrams}g zahăr • ${log.sugarType}'),
                                    Text('${log.hour}:${log.minute.toString().padLeft(2, '0')} • ${log.date}'),
                                    if (log.contextNote != null && log.contextNote!.isNotEmpty)
                                      Text(log.contextNote!, style: const TextStyle(fontStyle: FontStyle.italic)),
                                  ],
                                ),
                                trailing: PopupMenuButton(
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: 'edit',
                                      child: Row(
                                        children: [
                                          Icon(Icons.edit),
                                          SizedBox(width: 8),
                                          Text('Editează'),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 'delete',
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete, color: Colors.red),
                                          SizedBox(width: 8),
                                          Text('Șterge', style: TextStyle(color: Colors.red)),
                                        ],
                                      ),
                                    ),
                                  ],
                                  onSelected: (value) {
                                    if (value == 'edit') {
                                      context.go('/edit-log/${log.id}');
                                    } else if (value == 'delete') {
                                      _deleteLog(log.id);
                                    }
                                  },
                                ),
                                onTap: () => context.go('/edit-log/${log.id}'),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add-log'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
      ref.read(sugarLogProvider.notifier).loadLogsByDate(
        DateFormat('yyyy-MM-dd').format(picked),
      );
    }
  }

  void _deleteLog(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmare'),
        content: const Text('Ești sigur că vrei să ștergi acest log?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Anulează'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(sugarLogProvider.notifier).deleteLog(id);
            },
            child: const Text('Șterge', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}