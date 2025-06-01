import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emotion.g.dart';

@JsonEnum(alwaysCreate: true)
enum Emotion {
  @JsonValue('HAPPY')
  happy,

  @JsonValue('SAD')
  sad,

  @JsonValue('STRESSED')
  stressed,

  @JsonValue('ANXIOUS')
  anxious,

  @JsonValue('TIRED')
  tired,

  @JsonValue('BORED')
  bored,

  @JsonValue('NEUTRAL')
  neutral,
}

extension EmotionExtension on Emotion {
  String get label {
    switch (this) {
      case Emotion.happy:
        return 'Happy';
      case Emotion.sad:
        return 'Sad';
      case Emotion.stressed:
        return 'Stressed';
      case Emotion.anxious:
        return 'Anxious';
      case Emotion.tired:
        return 'Tired';
      case Emotion.bored:
        return 'Bored';
      case Emotion.neutral:
        return 'Neutral';
    }
  }

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
}
