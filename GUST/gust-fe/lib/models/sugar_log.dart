import 'package:freezed_annotation/freezed_annotation.dart';
import 'emotion.dart';

part 'sugar_log.freezed.dart';
part 'sugar_log.g.dart';

@freezed
class SugarLog with _$SugarLog {
  const factory SugarLog({
    required int id,
    required int sugarGrams,
    required DateTime date,
    required int hour,
    required int minute,
    required String productName,
    required String sugarType,
    String? contextNote,
    required Emotion emotion,
    String? location,
    @Default(false) bool wasCraving,
    int? userId,
  }) = _SugarLog;

  factory SugarLog.fromJson(Map<String, dynamic> json) => _$SugarLogFromJson(json);
}

@freezed
class SugarLogRequest with _$SugarLogRequest {
  const factory SugarLogRequest({
    required int sugarGrams,
    required String date, // Format: YYYY-MM-DD
    required int hour,
    required int minute,
    required String productName,
    required String sugarType,
    String? contextNote,
    required String emotion, // String for backend
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
    required String date,
    required int hour,
    required int minute,
    required String productName,
    required String sugarType,
    String? contextNote,
    required String emotion,
    String? location,
    @Default(false) bool wasCraving,
  }) = _SugarLogResponse;

  factory SugarLogResponse.fromJson(Map<String, dynamic> json) => _$SugarLogResponseFromJson(json);
}
