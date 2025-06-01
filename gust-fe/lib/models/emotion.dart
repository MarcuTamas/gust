import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emotion.g.dart';

@JsonEnum(valueField: 'value')
enum Emotion {
  @JsonValue('HAPPY')
  happy('HAPPY', 'Happy'),
  @JsonValue('SAD')
  sad('SAD', 'Sad'),
  @JsonValue('STRESSED')
  stressed('STRESSED', 'Stressed'),
  @JsonValue('ANXIOUS')
  anxious('ANXIOUS', 'Anxious'),
  @JsonValue('TIRED')
  tired('TIRED', 'Tired'),
  @JsonValue('BORED')
  bored('BORED', 'Bored'),
  @JsonValue('NEUTRAL')
  neutral('NEUTRAL', 'Neutral');

  const Emotion(this.value, this.label);

  final String value;
  final String label;

  // Getters for UI
  IconData get icon {
    switch (this) {
      case Emotion.happy:
        return Icons.sentiment_very_satisfied;
      case Emotion.sad:
        return Icons.sentiment_very_dissatisfied;
      case Emotion.stressed:
        return Icons.sentiment_dissatisfied;
      case Emotion.anxious:
        return Icons.sentiment_neutral;
      case Emotion.tired:
        return Icons.sentiment_satisfied_alt;
      case Emotion.bored:
        return Icons.sentiment_neutral;
      case Emotion.neutral:
        return Icons.sentiment_satisfied;
    }
  }

  Color get color {
    switch (this) {
      case Emotion.happy:
        return const Color(0xFFFFD700);
      case Emotion.sad:
        return const Color(0xFF4169E1);
      case Emotion.stressed:
        return const Color(0xFFDC143C);
      case Emotion.anxious:
        return const Color(0xFFFF8C00);
      case Emotion.tired:
        return const Color(0xFF9370DB);
      case Emotion.bored:
        return const Color(0xFF708090);
      case Emotion.neutral:
        return const Color(0xFF32CD32);
    }
  }

  String get emoji {
    switch (this) {
      case Emotion.happy:
        return '😊';
      case Emotion.sad:
        return '😢';
      case Emotion.stressed:
        return '😣';
      case Emotion.anxious:
        return '😰';
      case Emotion.tired:
        return '🥱';
      case Emotion.bored:
        return '😐';
      case Emotion.neutral:
        return '🙂';
    }
  }

  static Emotion fromString(String value) {
    return Emotion.values.firstWhere(
      (e) => e.value == value.toUpperCase(),
      orElse: () => Emotion.neutral,
    );
  }
}

extension EmotionJson on Emotion {
  String toJson() => _$EmotionEnumMap[this]!;
  static Emotion fromJson(String json) => _$EmotionEnumMap.entries
      .firstWhere((e) => e.value == json)
      .key;
}

@JsonSerializable()
class _EmotionDummy {
  final Emotion emotion;
  _EmotionDummy(this.emotion);

  Map<String, dynamic> toJson() => _$EmotionDummyToJson(this);
}