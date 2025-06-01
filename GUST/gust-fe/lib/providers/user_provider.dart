import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import 'auth_provider.dart';

final userStreakProvider = StateNotifierProvider<UserStreakNotifier, UserStreakState>((ref) {
  return UserStreakNotifier(ref.read(apiServiceProvider));
});

class UserStreakState {
  final int streak;
  final bool isLoading;
  final String? error;

  const UserStreakState({
    this.streak = 0,
    this.isLoading = false,
    this.error,
  });

  UserStreakState copyWith({
    int? streak,
    bool? isLoading,
    String? error,
  }) {
    return UserStreakState(
      streak: streak ?? this.streak,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class UserStreakNotifier extends StateNotifier<UserStreakState> {
  final ApiService _apiService;

  UserStreakNotifier(this._apiService) : super(const UserStreakState());

  Future<void> loadStreak() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _apiService.getMyStreak();
      state = state.copyWith(
        streak: response.streak,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error.toString().contains('401')) {
      return 'Not authenticated';
    } else if (error.toString().contains('connection')) {
      return 'No internet connection';
    }
    return 'An error occurred. Please try again.';
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
