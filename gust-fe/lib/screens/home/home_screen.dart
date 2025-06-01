import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/auth_provider.dart';
import '../../providers/sugar_log_provider.dart';
import '../../providers/user_provider.dart';
import '../../providers/user_streak_provider.dart';
import '../../widgets/streak_card.dart';
import '../../widgets/daily_summary_card.dart';
import '../../widgets/quick_add_button.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  void _loadData() {
    ref.read(sugarLogProvider.notifier).loadLogsByDate(
      DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
    ref.read(userStreakProvider.notifier).loadStreak();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    // Use the user's first name from authState if available, otherwise fallback to userProvider or 'User'
    final userName = authState.user?.fullName.split(' ').first
        ?? ref.watch(userProvider)
        ?? 'User';

    final sugarLogState = ref.watch(sugarLogProvider);
    final userStreakState = ref.watch(userStreakProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GUST'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadData(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greet the user
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          userName.substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, $userName!',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('dd MMMM yyyy').format(DateTime.now()),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Streak Card
              StreakCard(
                streak: userStreakState.streak,
                isLoading: userStreakState.isLoading,
              ),
              const SizedBox(height: 16),

              // Daily summary
              DailySummaryCard(
                logs: sugarLogState.logs,
                isLoading: sugarLogState.isLoading,
              ),
              const SizedBox(height: 16),

              // Quick actions
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              
              Row(
                children: [
                  Expanded(
                    child: QuickActionCard(
                      title: 'Add Log',
                      subtitle: 'Record your intake',
                      icon: Icons.add_circle,
                      color: Colors.green,
                      onTap: () => context.go('/add-log'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: QuickActionCard(
                      title: 'View Analytics',
                      subtitle: 'Analyze your data',
                      icon: Icons.analytics,
                      color: Colors.blue,
                      onTap: () => context.go('/analytics'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              
              Row(
                children: [
                  Expanded(
                    child: QuickActionCard(
                      title: 'All Logs',
                      subtitle: 'View history',
                      icon: Icons.list,
                      color: Colors.orange,
                      onTap: () => context.go('/logs'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: QuickActionCard(
                      title: 'Community',
                      subtitle: 'See leaderboard',
                      icon: Icons.people,
                      color: Colors.purple,
                      onTap: () => context.go('/community'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Today's logs
              if (sugarLogState.logs.isNotEmpty) ...[
                Text(
                  'Today\'s Logs (${sugarLogState.logs.length})',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...sugarLogState.logs.take(3).map((log) => 
                  Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Icon(
                        Icons.local_cafe,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(log.productName),
                      subtitle: Text('${log.sugarGrams}g sugar • ${log.hour}:${log.minute.toString().padLeft(2, '0')}'),
                      trailing: Icon(
                        Icons.sentiment_satisfied,
                        color: _getEmotionColor(log.emotion),
                      ),
                      onTap: () => context.go('/edit-log/${log.id}'),
                    ),
                  ),
                ),
                if (sugarLogState.logs.length > 3)
                  TextButton(
                    onPressed: () => context.go('/logs'),
                    child: Text('View all (${sugarLogState.logs.length})'),
                  ),
              ],
            ],
          ),
        ),
      ),
      floatingActionButton: QuickAddButton(
        onPressed: () => context.go('/add-log'),
      ),
    );
  }

  Color _getEmotionColor(String emotion) {
    switch (emotion.toUpperCase()) {
      case 'HAPPY': return Colors.yellow;
      case 'SAD': return Colors.blue;
      case 'STRESSED': return Colors.red;
      case 'ANXIOUS': return Colors.orange;
      case 'TIRED': return Colors.purple;
      case 'BORED': return Colors.grey;
      default: return Colors.green;
    }
  }
}

class QuickActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}