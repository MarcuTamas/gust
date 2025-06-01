import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/community.dart';
import '../services/api_service.dart';
import 'auth_provider.dart';

final communityProvider = StateNotifierProvider<CommunityNotifier, CommunityState>((ref) {
  return CommunityNotifier(ref.read(apiServiceProvider));
});

final userStreakProvider = StateNotifierProvider<UserStreakNotifier, UserStreakState>((ref) {
  return UserStreakNotifier(ref.read(apiServiceProvider));
});

class CommunityState {
  final List<UserRankingResponse> rankings;
  final bool isLoading;
  final String? error;
  final String currentPeriod;

  const CommunityState({
    this.rankings = const [],
    this.isLoading = false,
    this.error,
    this.currentPeriod = 'monthly',
  });

  CommunityState copyWith({
    List<UserRankingResponse>? rankings,
    bool? isLoading,
    String? error,
    String? currentPeriod,
  }) {
    return CommunityState(
      rankings: rankings ?? this.rankings,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      currentPeriod: currentPeriod ?? this.currentPeriod,
    );
  }
}

class CommunityNotifier extends StateNotifier<CommunityState> {
  final ApiService _apiService;

  CommunityNotifier(this._apiService) : super(const CommunityState());

  Future<void> loadRankings(String period) async {
    state = state.copyWith(isLoading: true, error: null, currentPeriod: period);
    
    try {
      final rankings = await _apiService.getRankings(period);
      state = state.copyWith(
        rankings: rankings,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Eroare la încărcarea clasamentului',
      );
    }
  }
}

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
        error: 'Eroare la încărcarea streak-ului',
      );
    }
  }
}