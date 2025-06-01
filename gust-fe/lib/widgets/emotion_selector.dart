import 'package:flutter/material.dart';
import '../models/emotion.dart';

class EmotionSelector extends StatelessWidget {
  final Emotion selectedEmotion;
  final ValueChanged<Emotion> onEmotionSelected;

  const EmotionSelector({
    super.key,
    required this.selectedEmotion,
    required this.onEmotionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: Emotion.values.map((emotion) {
        final isSelected = emotion == selectedEmotion;
        return GestureDetector(
          onTap: () => onEmotionSelected(emotion),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[200],
                child: Text(
                  emotion.emoji,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                emotion.label,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}