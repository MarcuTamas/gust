import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/sugar_log.dart';
import '../services/api_service.dart';
import 'auth_provider.dart';

final sugarLogProvider = StateNotifierProvider<SugarLogNotifier, SugarLogState>((ref) {
  return SugarLogNotifier(ref.read(apiServiceProvider));
});

class SugarLogState {
  final List<SugarLogResponse> logs;
  final bool isLoading;
  final String? error;
  final bool isCreating;
  final bool isUpdating;
  final bool isDeleting;

  const SugarLogState({
    this.logs = const [],
    this.isLoading = false,
    this.error,
    this.isCreating = false,
    this.isUpdating = false,
    this.isDeleting = false,
  });

  SugarLogState copyWith({
    List<SugarLogResponse>? logs,
    bool? isLoading,
    String? error,
    bool? isCreating,
    bool? isUpdating,
    bool? isDeleting,
  }) {
    return SugarLogState(
      logs: logs ?? this.logs,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isCreating: isCreating ?? this.isCreating,
      isUpdating: isUpdating ?? this.isUpdating,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }
}

class SugarLogNotifier extends StateNotifier<SugarLogState> {
  final ApiService _apiService;

  SugarLogNotifier(this._apiService) : super(const SugarLogState());

  Future<void> loadLogs() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final logs = await _apiService.getAllLogs();
      state = state.copyWith(
        logs: logs,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<void> loadLogsByDate(String date) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final logs = await _apiService.getLogsByDate(date);
      state = state.copyWith(
        logs: logs,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<bool> createLog(SugarLogRequest request) async {
    state = state.copyWith(isCreating: true, error: null);
    
    try {
      final newLog = await _apiService.createLog(request);
      final updatedLogs = [newLog, ...state.logs];
      state = state.copyWith(
        logs: updatedLogs,
        isCreating: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isCreating: false,
        error: _getErrorMessage(e),
      );
      return false;
    }
  }

  Future<bool> updateLog(int id, SugarLogRequest request) async {
    state = state.copyWith(isUpdating: true, error: null);
    
    try {
      final updatedLog = await _apiService.updateLog(id, request);
      final updatedLogs = state.logs.map((log) {
        if (log.id == id) {
          return updatedLog;
        }
        return log;
      }).toList();
      
      state = state.copyWith(
        logs: updatedLogs,
        isUpdating: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isUpdating: false,
        error: _getErrorMessage(e),
      );
      return false;
    }
  }

  Future<bool> deleteLog(int id) async {
    state = state.copyWith(isDeleting: true, error: null);
    
    try {
      await _apiService.deleteLog(id);
      final updatedLogs = state.logs.where((log) => log.id != id).toList();
      state = state.copyWith(
        logs: updatedLogs,
        isDeleting: false,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isDeleting: false,
        error: _getErrorMessage(e),
      );
      return false;
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error.toString().contains('401')) {
      return 'Nu ești autentificat';
    } else if (error.toString().contains('400')) {
      return 'Date invalide';
    } else if (error.toString().contains('404')) {
      return 'Log-ul nu a fost găsit';
    } else if (error.toString().contains('conexiune')) {
      return 'Nu există conexiune la internet';
    }
    return 'A apărut o eroare. Încearcă din nou.';
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}