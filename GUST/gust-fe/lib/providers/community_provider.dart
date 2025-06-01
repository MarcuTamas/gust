import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/community.dart';
import '../services/api_service.dart';
import 'auth_provider.dart';

final communityProvider = StateNotifierProvider<CommunityNotifier, CommunityState>((ref) {
  return CommunityNotifier(ref.read(apiServiceProvider));
});

class CommunityState {
  final List<UserRankingResponse> rankings;
  final bool isLoading;
  final String? error;

  const CommunityState({
    this.rankings = const [],
    this.isLoading = false,
    this.error,
  });

  CommunityState copyWith({
    List<UserRankingResponse>? rankings,
    bool? isLoading,
    String? error,
  }) {
    return CommunityState(
      rankings: rankings ?? this.rankings,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class CommunityNotifier extends StateNotifier<CommunityState> {
  final ApiService _apiService;

  CommunityNotifier(this._apiService) : super(const CommunityState());

  Future<void> loadRankings(String period) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final rankings = await _apiService.getRankings(period);
      state = state.copyWith(
        rankings: rankings,
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
