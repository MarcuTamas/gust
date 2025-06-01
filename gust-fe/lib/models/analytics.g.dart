// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticsResponseImpl _$$AnalyticsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsResponseImpl(
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AnalyticsResponseImplToJson(
        _$AnalyticsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$EmotionSummaryImpl _$$EmotionSummaryImplFromJson(Map<String, dynamic> json) =>
    _$EmotionSummaryImpl(
      emotionCounts: Map<String, int>.from(json['emotionCounts'] as Map),
      totalEntries: (json['totalEntries'] as num).toInt(),
    );

Map<String, dynamic> _$$EmotionSummaryImplToJson(
        _$EmotionSummaryImpl instance) =>
    <String, dynamic>{
      'emotionCounts': instance.emotionCounts,
      'totalEntries': instance.totalEntries,
    };

_$DailyTrendImpl _$$DailyTrendImplFromJson(Map<String, dynamic> json) =>
    _$DailyTrendImpl(
      dailyData: (json['dailyData'] as List<dynamic>)
          .map((e) => DailyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DailyTrendImplToJson(_$DailyTrendImpl instance) =>
    <String, dynamic>{
      'dailyData': instance.dailyData,
    };

_$DailyDataImpl _$$DailyDataImplFromJson(Map<String, dynamic> json) =>
    _$DailyDataImpl(
      date: json['date'] as String,
      totalSugar: (json['totalSugar'] as num).toInt(),
      entryCount: (json['entryCount'] as num).toInt(),
    );

Map<String, dynamic> _$$DailyDataImplToJson(_$DailyDataImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'totalSugar': instance.totalSugar,
      'entryCount': instance.entryCount,
    };

_$TimeOfDayPatternImpl _$$TimeOfDayPatternImplFromJson(
        Map<String, dynamic> json) =>
    _$TimeOfDayPatternImpl(
      hourlyAverages: (json['hourlyAverages'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$TimeOfDayPatternImplToJson(
        _$TimeOfDayPatternImpl instance) =>
    <String, dynamic>{
      'hourlyAverages': instance.hourlyAverages,
    };

_$MonthlyTotalImpl _$$MonthlyTotalImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyTotalImpl(
      monthlyData: (json['monthlyData'] as List<dynamic>)
          .map((e) => MonthlyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MonthlyTotalImplToJson(_$MonthlyTotalImpl instance) =>
    <String, dynamic>{
      'monthlyData': instance.monthlyData,
    };

_$MonthlyDataImpl _$$MonthlyDataImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyDataImpl(
      month: json['month'] as String,
      totalSugar: (json['totalSugar'] as num).toInt(),
      entryCount: (json['entryCount'] as num).toInt(),
    );

Map<String, dynamic> _$$MonthlyDataImplToJson(_$MonthlyDataImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'totalSugar': instance.totalSugar,
      'entryCount': instance.entryCount,
    };
