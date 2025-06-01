import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserStreakState {
  final int streak;
  final bool isLoading;
  UserStreakState({this.streak = 0, this.isLoading = false});
}

class UserStreakNotifier extends StateNotifier<UserStreakState> {
  UserStreakNotifier() : super(UserStreakState());

  Future<void> loadStreak() async {
    state = UserStreakState(streak: state.streak, isLoading: true);
    // Simulate loading
    await Future.delayed(const Duration(milliseconds: 500));
    state = UserStreakState(streak: 5, isLoading: false); // Example value
  }
}

final userStreakProvider = StateNotifierProvider<UserStreakNotifier, UserStreakState>(
  (ref) => UserStreakNotifier(),
);