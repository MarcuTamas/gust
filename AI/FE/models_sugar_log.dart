import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gust_flutter/models/emotion.dart';

part 'sugar_log.freezed.dart';
part 'sugar_log.g.dart';

@freezed
class SugarLog with _$SugarLog {
  const factory SugarLog({
    required int id,
    required int sugarGrams,
    
    // Data și ora
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) 
    required DateTime date,
    required int hour,
    required int minute,
    
    // Detalii produs
    required String productName,
    required String sugarType,
    String? contextNote,
    
    // Context
    required Emotion emotion,
    String? location,
    @Default(false) bool wasCraving,
    
    // ID utilizator (poate fi null în unele cazuri)
    int? userId,
  }) = _SugarLog;

  factory SugarLog.fromJson(Map<String, dynamic> json) => _$SugarLogFromJson(json);
}

@freezed
class SugarLogRequest with _$SugarLogRequest {
  const factory SugarLogRequest({
    required int sugarGrams,
    
    // Data și ora
    @JsonKey(toJson: _dateToJson) 
    required DateTime date,
    required int hour,
    required int minute,
    
    // Detalii produs
    required String productName,
    required String sugarType,
    String? contextNote,
    
    // Context
    @JsonKey(toJson: _emotionToJson)
    required Emotion emotion,
    String? location,
    @Default(false) bool wasCraving,
  }) = _SugarLogRequest;

  factory SugarLogRequest.fromJson(Map<String, dynamic> json) => _$SugarLogRequestFromJson(json);
}

@freezed
class SugarLogResponse with _$SugarLogResponse {
  const factory SugarLogResponse({
    required int id,
    required int sugarGrams,
    
    // Data și ora
    @JsonKey(fromJson: _dateTimeFromJson) 
    required DateTime date,
    required int hour,
    required int minute,
    
    // Detalii produs
    required String productName,
    required String sugarType,
    String? contextNote,
    
    // Context
    @JsonKey(fromJson: _emotionFromJson)
    required Emotion emotion,
    String? location,
    @Default(false) bool wasCraving,
  }) = _SugarLogResponse;

  factory SugarLogResponse.fromJson(Map<String, dynamic> json) => _$SugarLogResponseFromJson(json);
}

// Helper pentru conversia dintre string ISO date și DateTime
DateTime _dateTimeFromJson(String date) => DateTime.parse(date);
String _dateTimeToJson(DateTime date) => date.toIso8601String().split('T').first;
String _dateToJson(DateTime date) => date.toIso8601String().split('T').first;

// Helper pentru conversia dintre string Emotion și enum Emotion
Emotion _emotionFromJson(String emotion) => Emotion.fromString(emotion);
String _emotionToJson(Emotion emotion) => emotion.value;