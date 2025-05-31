import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics.freezed.dart';
part 'analytics.g.dart';

@freezed
class AnalyticsResponse with _$AnalyticsResponse {
  const factory AnalyticsResponse({
    required Map<String, dynamic> data,
  }) = _AnalyticsResponse;

  factory AnalyticsResponse.fromJson(Map<String, dynamic> json) => _$AnalyticsResponseFromJson(json);
}

@freezed
class EmotionSummary with _$EmotionSummary {
  const factory EmotionSummary({
    required Map<String, int> emotionCounts,
    required int totalEntries,
  }) = _EmotionSummary;

  factory EmotionSummary.fromJson(Map<String, dynamic> json) => _$EmotionSummaryFromJson(json);
}

@freezed
class DailyTrend with _$DailyTrend {
  const factory DailyTrend({
    required List<DailyData> dailyData,
  }) = _DailyTrend;

  factory DailyTrend.fromJson(Map<String, dynamic> json) => _$DailyTrendFromJson(json);
}

@freezed
class DailyData with _$DailyData {
  const factory DailyData({
    required String date,
    required int totalSugar,
    required int entryCount,
  }) = _DailyData;

  factory DailyData.fromJson(Map<String, dynamic> json) => _$DailyDataFromJson(json);
}

@freezed
class TimeOfDayPattern with _$TimeOfDayPattern {
  const factory TimeOfDayPattern({
    required Map<String, double> hourlyAverages,
  }) = _TimeOfDayPattern;

  factory TimeOfDayPattern.fromJson(Map<String, dynamic> json) => _$TimeOfDayPatternFromJson(json);
}

@freezed
class MonthlyTotal with _$MonthlyTotal {
  const factory MonthlyTotal({
    required List<MonthlyData> monthlyData,
  }) = _MonthlyTotal;

  factory MonthlyTotal.fromJson(Map<String, dynamic> json) => _$MonthlyTotalFromJson(json);
}

@freezed
class MonthlyData with _$MonthlyData {
  const factory MonthlyData({
    required String month,
    required int totalSugar,
    required int entryCount,
  }) = _MonthlyData;

  factory MonthlyData.fromJson(Map<String, dynamic> json) => _$MonthlyDataFromJson(json);
}
