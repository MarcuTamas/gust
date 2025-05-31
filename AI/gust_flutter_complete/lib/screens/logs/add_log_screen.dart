import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/sugar_log_provider.dart';
import '../../models/emotion.dart';
import '../../models/sugar_log.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/loading_button.dart';
import '../../widgets/emotion_selector.dart';

class AddLogScreen extends ConsumerStatefulWidget {
  const AddLogScreen({super.key});

  @override
  ConsumerState<AddLogScreen> createState() => _AddLogScreenState();
}

class _AddLogScreenState extends ConsumerState<AddLogScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productController = TextEditingController();
  final _sugarController = TextEditingController();
  final _sugarTypeController = TextEditingController();
  final _contextController = TextEditingController();
  final _locationController = TextEditingController();
  
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  Emotion _selectedEmotion = Emotion.neutral;
  bool _wasCraving = false;

  @override
  void dispose() {
    _productController.dispose();
    _sugarController.dispose();
    _sugarTypeController.dispose();
    _contextController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sugarLogState = ref.watch(sugarLogProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaugă Log Zahăr'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Produs
              CustomTextField(
                controller: _productController,
                label: 'Nume produs *',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Numele produsului este obligatoriu';
                  }
                  return null;
                },
                prefixIcon: Icons.local_cafe,
              ),
              const SizedBox(height: 16),

              // Cantitate zahăr
              CustomTextField(
                controller: _sugarController,
                label: 'Cantitate zahăr (grame) *',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Cantitatea este obligatorie';
                  }
                  final grams = int.tryParse(value);
                  if (grams == null || grams <= 0) {
                    return 'Introduceți o cantitate validă';
                  }
                  return null;
                },
                prefixIcon: Icons.scale,
              ),
              const SizedBox(height: 16),

              // Tip zahăr
              CustomTextField(
                controller: _sugarTypeController,
                label: 'Tip zahăr *',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tipul zahărului este obligatoriu';
                  }
                  return null;
                },
                prefixIcon: Icons.category,
              ),
              const SizedBox(height: 16),

              // Data și ora
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: _selectDate,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Dată',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                        child: Text(
                          DateFormat('dd/MM/yyyy').format(_selectedDate),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InkWell(
                      onTap: _selectTime,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Oră',
                          prefixIcon: Icon(Icons.access_time),
                          border: OutlineInputBorder(),
                        ),
                        child: Text(
                          _selectedTime.format(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Emoție
              const Text(
                'Cum te simți? *',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              EmotionSelector(
                selectedEmotion: _selectedEmotion,
                onEmotionSelected: (emotion) {
                  setState(() {
                    _selectedEmotion = emotion;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Context
              CustomTextField(
                controller: _contextController,
                label: 'Context/Notă',
                hint: 'De ce ai consumat zahăr?',
                maxLines: 3,
                prefixIcon: Icons.note,
              ),
              const SizedBox(height: 16),

              // Locație
              CustomTextField(
                controller: _locationController,
                label: 'Locație',
                hint: 'Unde ai fost?',
                prefixIcon: Icons.location_on,
              ),
              const SizedBox(height: 16),

              // A fost poftă?
              SwitchListTile(
                title: const Text('A fost o poftă?'),
                subtitle: const Text('Ai avut poftă de zahăr când ai consumat?'),
                value: _wasCraving,
                onChanged: (value) {
                  setState(() {
                    _wasCraving = value;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Buton salvare
              LoadingButton(
                onPressed: _saveLog,
                isLoading: sugarLogState.isCreating,
                child: const Text('Salvează Log'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _saveLog() {
    if (_formKey.currentState!.validate()) {
      final request = SugarLogRequest(
        sugarGrams: int.parse(_sugarController.text),
        date: DateFormat('yyyy-MM-dd').format(_selectedDate),
        hour: _selectedTime.hour,
        minute: _selectedTime.minute,
        productName: _productController.text.trim(),
        sugarType: _sugarTypeController.text.trim(),
        contextNote: _contextController.text.trim().isEmpty ? null : _contextController.text.trim(),
        emotion: _selectedEmotion.value,
        location: _locationController.text.trim().isEmpty ? null : _locationController.text.trim(),
        wasCraving: _wasCraving,
      );

      ref.read(sugarLogProvider.notifier).createLog(request).then((success) {
        if (success) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Log salvat cu succes!')),
          );
        }
      });
    }
  }
}
