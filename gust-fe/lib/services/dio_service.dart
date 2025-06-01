import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../config/app_config.dart';
import 'storage_service.dart';

class DioService {
  static final DioService _instance = DioService._internal();
  static DioService get instance => _instance;
  DioService._internal();

  late Dio _dio;
  Dio get dio => _dio;

  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      sendTimeout: AppConfig.sendTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Interceptor pentru loguri
    _dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));

    // Interceptor pentru autentificare
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await StorageService.instance.getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            // Token expirat - redirectează la login
            await StorageService.instance.clearAuthData();
            // Aici ai putea adăuga logica de navigare către login
          }
          handler.next(error);
        },
      ),
    );

    // Interceptor pentru conectivitate
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final connectivityResult = await Connectivity().checkConnectivity();
          if (connectivityResult == ConnectivityResult.none) {
            throw DioException(
              requestOptions: options,
              error: 'Nu există conexiune la internet',
              type: DioExceptionType.connectionError,
            );
          }
          handler.next(options);
        },
      ),
    );
  }
}