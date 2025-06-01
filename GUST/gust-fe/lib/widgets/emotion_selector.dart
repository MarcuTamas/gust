import 'package:flutter/material.dart';
import '../models/emotion.dart';

class EmotionSelector extends StatelessWidget {
  final Emotion selectedEmotion;
  final Function(Emotion) onEmotionSelected;

  const EmotionSelector({
    super.key,
    required this.selectedEmotion,
    required this.onEmotionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: Emotion.values.map((emotion) {
        final isSelected = emotion == selectedEmotion;
        return ChoiceChip(
          label: Text(emotion.label),
          avatar: Icon(
            emotion.icon,
            color: isSelected ? Colors.white : emotion.color,
          ),
          selected: isSelected,
          selectedColor: Theme.of(context).primaryColor,
          onSelected: (_) {
            onEmotionSelected(emotion);
          },
        );
      }).toList(),
    );
  }
}
