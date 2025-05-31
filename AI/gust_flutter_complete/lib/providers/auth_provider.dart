import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../services/dio_service.dart';
import '../services/storage_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(DioService.instance.dio);
});

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(apiServiceProvider));
});

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final ApiService _apiService;

  AuthNotifier(this._apiService) : super(const AuthState()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final isLoggedIn = await StorageService.instance.isLoggedIn();
    if (isLoggedIn) {
      final user = await StorageService.instance.getUser();
      state = state.copyWith(
        user: user,
        isAuthenticated: true,
      );
    }
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final request = LoginRequest(email: email, password: password);
      final response = await _apiService.login(request);
      
      await StorageService.instance.saveAccessToken(response.token);
      await StorageService.instance.saveUser(response.user);
      
      state = state.copyWith(
        user: response.user,
        isAuthenticated: true,
        isLoading: false,
      );
      
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
      return false;
    }
  }

  Future<bool> register(String fullName, String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final request = RegisterRequest(
        fullName: fullName,
        email: email,
        password: password,
      );
      final response = await _apiService.register(request);
      
      await StorageService.instance.saveAccessToken(response.token);
      await StorageService.instance.saveUser(response.user);
      
      state = state.copyWith(
        user: response.user,
        isAuthenticated: true,
        isLoading: false,
      );
      
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
      return false;
    }
  }

  Future<void> logout() async {
    await StorageService.instance.clearAuthData();
    state = const AuthState();
  }

  String _getErrorMessage(dynamic error) {
    if (error.toString().contains('401')) {
      return 'Email sau parolă incorectă';
    } else if (error.toString().contains('400')) {
      return 'Date invalide';
    } else if (error.toString().contains('409')) {
      return 'Email-ul este deja înregistrat';
    } else if (error.toString().contains('conexiune')) {
      return 'Nu există conexiune la internet';
    }
    return 'A apărut o eroare. Încearcă din nou.';
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}