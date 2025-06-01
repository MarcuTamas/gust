import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/analytics.dart';
import '../services/api_service.dart';
import 'auth_provider.dart';

final analyticsProvider = StateNotifierProvider<AnalyticsNotifier, AnalyticsState>((ref) {
  return AnalyticsNotifier(ref.read(apiServiceProvider));
});

class AnalyticsState {
  final AnalyticsResponse? emotionSummary;
  final AnalyticsResponse? dailyTrend;
  final AnalyticsResponse? timeOfDayPattern;
  final AnalyticsResponse? monthlyTotals;
  final bool isLoading;
  final String? error;

  const AnalyticsState({
    this.emotionSummary,
    this.dailyTrend,
    this.timeOfDayPattern,
    this.monthlyTotals,
    this.isLoading = false,
    this.error,
  });

  AnalyticsState copyWith({
    AnalyticsResponse? emotionSummary,
    AnalyticsResponse? dailyTrend,
    AnalyticsResponse? timeOfDayPattern,
    AnalyticsResponse? monthlyTotals,
    bool? isLoading,
    String? error,
  }) {
    return AnalyticsState(
      emotionSummary: emotionSummary ?? this.emotionSummary,
      dailyTrend: dailyTrend ?? this.dailyTrend,
      timeOfDayPattern: timeOfDayPattern ?? this.timeOfDayPattern,
      monthlyTotals: monthlyTotals ?? this.monthlyTotals,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class AnalyticsNotifier extends StateNotifier<AnalyticsState> {
  final ApiService _apiService;

  AnalyticsNotifier(this._apiService) : super(const AnalyticsState());

  Future<void> loadEmotionSummary(int month, int year) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final summary = await _apiService.getEmotionSummary(month, year);
      state = state.copyWith(
        emotionSummary: summary,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<void> loadDailyTrend(int month, int year) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final trend = await _apiService.getDailyTrend(month, year);
      state = state.copyWith(
        dailyTrend: trend,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<void> loadTimeOfDayPattern() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final pattern = await _apiService.getTimeOfDayPattern();
      state = state.copyWith(
        timeOfDayPattern: pattern,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<void> loadMonthlyTotals() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final totals = await _apiService.getMonthlyTotals();
      state = state.copyWith(
        monthlyTotals: totals,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<List<int>?> exportCsv() async {
    try {
      return await _apiService.exportCsv();
    } catch (e) {
      state = state.copyWith(error: _getErrorMessage(e));
      return null;
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error.toString().contains('401')) {
      return 'Not authenticated';
    } else if (error.toString().contains('connection')) {
      return 'No internet connection';
    }
    return 'An error occurred. Please try again.';
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
