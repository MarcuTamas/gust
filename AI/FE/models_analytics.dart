import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics.freezed.dart';
part 'analytics.g.dart';

@freezed
class EmotionSummary with _$EmotionSummary {
  const factory EmotionSummary({
    required String emotion,
    required int count,
    required double percentage,
  }) = _EmotionSummary;

  factory EmotionSummary.fromJson(Map<String, dynamic> json) => _$EmotionSummaryFromJson(json);
}

@freezed
class DailyTrendData with _$DailyTrendData {
  const factory DailyTrendData({
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'totalSugar') required int totalSugar,
    @JsonKey(name: 'logCount') required int logCount,
    @JsonKey(name: 'averageSugar') required double averageSugar,
  }) = _DailyTrendData;

  factory DailyTrendData.fromJson(Map<String, dynamic> json) => _$DailyTrendDataFromJson(json);
}

@freezed
class TimeOfDayPattern with _$TimeOfDayPattern {
  const factory TimeOfDayPattern({
    required int hour,
    required double averageSugar,
    required int count,
  }) = _TimeOfDayPattern;

  factory TimeOfDayPattern.fromJson(Map<String, dynamic> json) => _$TimeOfDayPatternFromJson(json);
}

@freezed
class MonthlyTotal with _$MonthlyTotal {
  const factory MonthlyTotal({
    required int year,
    required int month,
    required int totalSugar,
    required int logCount,
    required double averageDailySugar,
  }) = _MonthlyTotal;

  factory MonthlyTotal.fromJson(Map<String, dynamic> json) => _$MonthlyTotalFromJson(json);
}

@freezed
class AnalyticsData with _$AnalyticsData {
  const factory AnalyticsData({
    List<EmotionSummary>? emotionSummary,
    List<DailyTrendData>? dailyTrend,
    List<TimeOfDayPattern>? timeOfDayPattern,
    List<MonthlyTotal>? monthlyTotals,
  }) = _AnalyticsData;

  factory AnalyticsData.fromJson(Map<String, dynamic> json) => _$AnalyticsDataFromJson(json);
}

// Response wrapper pentru consistență cu backend-ul
@freezed
class AnalyticsResponse<T> with _$AnalyticsResponse<T> {
  const factory AnalyticsResponse({
    required T data,
    String? message,
    bool? success,
  }) = _AnalyticsResponse<T>;

  factory AnalyticsResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return AnalyticsResponse(
      data: fromJsonT(json['data'] ?? json),
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );
  }
}