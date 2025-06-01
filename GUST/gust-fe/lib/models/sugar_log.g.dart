// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sugar_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SugarLogImpl _$$SugarLogImplFromJson(Map<String, dynamic> json) =>
    _$SugarLogImpl(
      id: (json['id'] as num).toInt(),
      sugarGrams: (json['sugarGrams'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      productName: json['productName'] as String,
      sugarType: json['sugarType'] as String,
      contextNote: json['contextNote'] as String?,
      emotion: $enumDecode(_$EmotionEnumMap, json['emotion']),
      location: json['location'] as String?,
      wasCraving: json['wasCraving'] as bool? ?? false,
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SugarLogImplToJson(_$SugarLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sugarGrams': instance.sugarGrams,
      'date': instance.date.toIso8601String(),
      'hour': instance.hour,
      'minute': instance.minute,
      'productName': instance.productName,
      'sugarType': instance.sugarType,
      'contextNote': instance.contextNote,
      'emotion': _$EmotionEnumMap[instance.emotion]!,
      'location': instance.location,
      'wasCraving': instance.wasCraving,
      'userId': instance.userId,
    };

const _$EmotionEnumMap = {
  Emotion.happy: 'HAPPY',
  Emotion.sad: 'SAD',
  Emotion.stressed: 'STRESSED',
  Emotion.anxious: 'ANXIOUS',
  Emotion.tired: 'TIRED',
  Emotion.bored: 'BORED',
  Emotion.neutral: 'NEUTRAL',
};

_$SugarLogRequestImpl _$$SugarLogRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SugarLogRequestImpl(
      sugarGrams: (json['sugarGrams'] as num).toInt(),
      date: json['date'] as String,
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      productName: json['productName'] as String,
      sugarType: json['sugarType'] as String,
      contextNote: json['contextNote'] as String?,
      emotion: json['emotion'] as String,
      location: json['location'] as String?,
      wasCraving: json['wasCraving'] as bool? ?? false,
    );

Map<String, dynamic> _$$SugarLogRequestImplToJson(
        _$SugarLogRequestImpl instance) =>
    <String, dynamic>{
      'sugarGrams': instance.sugarGrams,
      'date': instance.date,
      'hour': instance.hour,
      'minute': instance.minute,
      'productName': instance.productName,
      'sugarType': instance.sugarType,
      'contextNote': instance.contextNote,
      'emotion': instance.emotion,
      'location': instance.location,
      'wasCraving': instance.wasCraving,
    };

_$SugarLogResponseImpl _$$SugarLogResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SugarLogResponseImpl(
      id: (json['id'] as num).toInt(),
      sugarGrams: (json['sugarGrams'] as num).toInt(),
      date: json['date'] as String,
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      productName: json['productName'] as String,
      sugarType: json['sugarType'] as String,
      contextNote: json['contextNote'] as String?,
      emotion: json['emotion'] as String,
      location: json['location'] as String?,
      wasCraving: json['wasCraving'] as bool? ?? false,
    );

Map<String, dynamic> _$$SugarLogResponseImplToJson(
        _$SugarLogResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sugarGrams': instance.sugarGrams,
      'date': instance.date,
      'hour': instance.hour,
      'minute': instance.minute,
      'productName': instance.productName,
      'sugarType': instance.sugarType,
      'contextNote': instance.contextNote,
      'emotion': instance.emotion,
      'location': instance.location,
      'wasCraving': instance.wasCraving,
    };
