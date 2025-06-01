import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/analytics_provider.dart';
import '../../widgets/analytics_chart.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  @override
  void initState() {
    super.initState();
    _loadAnalytics();
  }

  void _loadAnalytics() {
    final now = DateTime.now();
    ref.read(analyticsProvider.notifier).loadEmotionSummary(now.month, now.year);
    ref.read(analyticsProvider.notifier).loadDailyTrend(now.month, now.year);
    ref.read(analyticsProvider.notifier).loadTimeOfDayPattern();
    ref.read(analyticsProvider.notifier).loadMonthlyTotals();
  }

  @override
  Widget build(BuildContext context) {
    final analyticsState = ref.watch(analyticsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadAnalytics,
          ),
        ],
      ),
      body: analyticsState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : analyticsState.error != null
              ? Center(child: Text(analyticsState.error!))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (analyticsState.emotionSummary != null)
                        AnalyticsChart(
                          title: 'Emotion Summary',
                          data: analyticsState.emotionSummary!.data.values.toList(),
                        ),
                      const SizedBox(height: 16),
                      if (analyticsState.dailyTrend != null)
                        AnalyticsChart(
                          title: 'Daily Trend',
                          data: analyticsState.dailyTrend!.data.values.toList(),
                        ),
                      const SizedBox(height: 16),
                      if (analyticsState.timeOfDayPattern != null)
                        AnalyticsChart(
                          title: 'Time of Day Pattern',
                          data: analyticsState.timeOfDayPattern!.data.values.toList(),
                        ),
                      const SizedBox(height: 16),
                      if (analyticsState.monthlyTotals != null)
                        AnalyticsChart(
                          title: 'Monthly Totals',
                          data: analyticsState.monthlyTotals!.data.values.toList(),
                        ),
                    ],
                  ),
                ),
    );
  }
}
