// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmotionDummy _$EmotionDummyFromJson(Map<String, dynamic> json) =>
    _EmotionDummy(
      $enumDecode(_$EmotionEnumMap, json['emotion']),
    );

Map<String, dynamic> _$EmotionDummyToJson(_EmotionDummy instance) =>
    <String, dynamic>{
      'emotion': _$EmotionEnumMap[instance.emotion]!,
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
