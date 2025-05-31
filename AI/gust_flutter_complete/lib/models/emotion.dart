import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emotion.g.dart';

@JsonEnum(valueField: 'value')
enum Emotion {
  @JsonValue('HAPPY')
  happy('HAPPY', 'Fericit', Icons.sentiment_very_satisfied, Color(0xFFFFD700)),
  
  @JsonValue('SAD')
  sad('SAD', 'Trist', Icons.sentiment_very_dissatisfied, Color(0xFF4169E1)),
  
  @JsonValue('STRESSED')
  stressed('STRESSED', 'Stresat', Icons.sentiment_dissatisfied, Color(0xFFDC143C)),
  
  @JsonValue('ANXIOUS')
  anxious('ANXIOUS', 'Anxios', Icons.sentiment_neutral, Color(0xFFFF8C00)),
  
  @JsonValue('TIRED')
  tired('TIRED', 'Obosit', Icons.sentiment_satisfied_alt, Color(0xFF9370DB)),
  
  @JsonValue('BORED')
  bored('BORED', 'Plictisit', Icons.sentiment_neutral, Color(0xFF708090)),
  
  @JsonValue('NEUTRAL')
  neutral('NEUTRAL', 'Neutru', Icons.sentiment_satisfied, Color(0xFF32CD32));

  const Emotion(this.value, this.label, this.icon, this.color);
  
  final String value;
  final String label;
  final IconData icon;
  final Color color;
  
  static Emotion fromString(String value) {
    return Emotion.values.firstWhere(
      (e) => e.value == value.toUpperCase(),
      orElse: () => Emotion.neutral,
    );
  }
}