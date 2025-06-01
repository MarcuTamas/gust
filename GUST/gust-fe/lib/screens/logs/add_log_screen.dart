import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/sugar_log.dart';
import '../../models/emotion.dart';
import '../../providers/sugar_log_provider.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/loading_button.dart';
import '../../widgets/emotion_selector.dart';
import '../../utils/validators.dart';

extension EmotionX on Emotion {
  String get value => toString().split('.').last.toUpperCase();
}

class AddLogScreen extends ConsumerStatefulWidget {
  const AddLogScreen({super.key});

  @override
  ConsumerState<AddLogScreen> createState() => _AddLogScreenState();
}

class _AddLogScreenState extends ConsumerState<AddLogScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _sugarGramsController = TextEditingController();
  final _contextNoteController = TextEditingController();
  final _locationController = TextEditingController();

  String _selectedSugarType = 'Sugar';
  Emotion _selectedEmotion = Emotion.neutral;
  bool _wasCraving = false;
  TimeOfDay _time = TimeOfDay.now();

  @override
  void dispose() {
    _productNameController.dispose();
    _sugarGramsController.dispose();
    _contextNoteController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sugarLogState = ref.watch(sugarLogProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Sugar Log'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _productNameController,
                label: 'Product Name',
                validator: (value) =>
                    RequiredValidator.dirty(value ?? '').error?.text,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _sugarGramsController,
                label: 'Sugar Grams',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  final n = int.tryParse(value);
                  if (n == null || n < 1 || n > 1000) {
                    return 'Enter a number between 1 and 1000';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedSugarType,
                items: ['Sugar', 'Fructose', 'Glucose', 'Sucrose']
                    .map((type) =>
                        DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSugarType = value ?? 'Sugar';
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Sugar Type',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              EmotionSelector(
                selectedEmotion: _selectedEmotion,
                onEmotionSelected: (emotion) {
                  setState(() {
                    _selectedEmotion = emotion;
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _contextNoteController,
                label: 'Context Note (Optional)',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _locationController,
                label: 'Location (Optional)',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text('Time: ${_time.format(context)}'),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _selectTime,
                    child: const Text('Select Time'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('Was craving?'),
                value: _wasCraving,
                onChanged: (value) {
                  setState(() {
                    _wasCraving = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 24),
              LoadingButton(
                isLoading: sugarLogState.isCreating,
                onPressed: _handleSubmit,
                child: const Text('Add Log'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      final now = DateTime.now();
      final dateString = DateTime(now.year, now.month, now.day).toIso8601String().split('T').first;

      final request = SugarLogRequest(
        sugarGrams: int.parse(_sugarGramsController.text.trim()),
        date: dateString,
        hour: _time.hour,
        minute: _time.minute,
        productName: _productNameController.text.trim(),
        sugarType: _selectedSugarType,
        contextNote: _contextNoteController.text.trim().isEmpty ? null : _contextNoteController.text.trim(),
        emotion: _selectedEmotion.value,
        location: _locationController.text.trim().isEmpty ? null : _locationController.text.trim(),
        wasCraving: _wasCraving,
      );

      final success = await ref.read(sugarLogProvider.notifier).createLog(request);
      if (success) {
        if (mounted) {
          context.pop();
        }
      }
    }
  }
}
