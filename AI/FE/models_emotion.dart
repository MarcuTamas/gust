import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

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
  String get displayName {
    switch (this) {
      case Emotion.happy:
        return 'Fericit';
      case Emotion.sad:
        return 'Trist';
      case Emotion.stressed:
        return 'Stresat';
      case Emotion.anxious:
        return 'Anxios';
      case Emotion.tired:
        return 'Obosit';
      case Emotion.bored:
        return 'Plictisit';
      case Emotion.neutral:
        return 'Neutru';
    }
  }

  String get value {
    switch (this) {
      case Emotion.happy:
        return 'HAPPY';
      case Emotion.sad:
        return 'SAD';
      case Emotion.stressed:
        return 'STRESSED';
      case Emotion.anxious:
        return 'ANXIOUS';
      case Emotion.tired:
        return 'TIRED';
      case Emotion.bored:
        return 'BORED';
      case Emotion.neutral:
        return 'NEUTRAL';
    }
  }

  Color get color {
    switch (this) {
      case Emotion.happy:
        return const Color(0xFF68D391); // Verde deschis
      case Emotion.sad:
        return const Color(0xFF4299E1); // Albastru
      case Emotion.stressed:
        return const Color(0xFFFC8181); // Roșu deschis
      case Emotion.anxious:
        return const Color(0xFFED8936); // Portocaliu
      case Emotion.tired:
        return const Color(0xFF9F7AEA); // Violet
      case Emotion.bored:
        return const Color(0xFFA0AEC0); // Gri
      case Emotion.neutral:
        return const Color(0xFF718096); // Gri închis
    }
  }

  IconData get icon {
    switch (this) {
      case Emotion.happy:
        return Icons.sentiment_very_satisfied;
      case Emotion.sad:
        return Icons.sentiment_very_dissatisfied;
      case Emotion.stressed:
        return Icons.psychology_alt;
      case Emotion.anxious:
        return Icons.anxiety;
      case Emotion.tired:
        return Icons.bedtime;
      case Emotion.bored:
        return Icons.sentiment_neutral;
      case Emotion.neutral:
        return Icons.sentiment_satisfied;
    }
  }

  static Emotion fromString(String value) {
    switch (value.toUpperCase()) {
      case 'HAPPY':
        return Emotion.happy;
      case 'SAD':
        return Emotion.sad;
      case 'STRESSED':
        return Emotion.stressed;
      case 'ANXIOUS':
        return Emotion.anxious;
      case 'TIRED':
        return Emotion.tired;
      case 'BORED':
        return Emotion.bored;
      case 'NEUTRAL':
      default:
        return Emotion.neutral;
    }
  }

  static List<Emotion> get allEmotions => Emotion.values;
}