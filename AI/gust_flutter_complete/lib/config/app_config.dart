class AppConfig {
  static const String baseUrl = 'http://localhost:8080';
  static const String apiVersion = '/api';
  static const String authPath = '/auth';
  
  // Timeout-uri
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  
  // Storage keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  
  // Validări
  static const int minPasswordLength = 6;
  static const int maxSugarGrams = 1000;
  static const int minSugarGrams = 1;
}
