import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../config/app_config.dart';
import '../models/user.dart';
import '../models/sugar_log.dart';
import '../models/analytics.dart';
import '../models/community.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Auth endpoints
  @POST('/api/auth/register')
  Future<AuthResponse> register(@Body() RegisterRequest request);

  @POST('/api/auth/login')
  Future<AuthResponse> login(@Body() LoginRequest request);

  // Sugar Log endpoints
  @POST('/api/sugarlogs')
  Future<SugarLogResponse> createLog(@Body() SugarLogRequest request);

  @GET('/api/sugarlogs')
  Future<List<SugarLogResponse>> getAllLogs();

  @GET('/api/sugarlogs/by-date')
  Future<List<SugarLogResponse>> getLogsByDate(@Query('date') String date);

  @GET('/api/sugarlogs/{id}')
  Future<SugarLogResponse> getLogById(@Path('id') int id);

  @PUT('/api/sugarlogs/{id}')
  Future<SugarLogResponse> updateLog(@Path('id') int id, @Body() SugarLogRequest request);

  @DELETE('/api/sugarlogs/{id}')
  Future<void> deleteLog(@Path('id') int id);

  // Analytics endpoints
  @GET('/api/analytics/emotion-summary')
  Future<AnalyticsResponse> getEmotionSummary(
    @Query('month') int month,
    @Query('year') int year,
  );

  @GET('/api/analytics/daily-trend')
  Future<AnalyticsResponse> getDailyTrend(
    @Query('month') int month,
    @Query('year') int year,
  );

  @GET('/api/analytics/time-of-day-pattern')
  Future<AnalyticsResponse> getTimeOfDayPattern();

  @GET('/api/analytics/monthly-total')
  Future<AnalyticsResponse> getMonthlyTotals();

  @GET('/api/analytics/export/csv')
  Future<List<int>> exportCsv();

  // Community endpoints
  @GET('/api/community/rankings')
  Future<List<UserRankingResponse>> getRankings(@Query('period') String period);

  // User endpoints
  @GET('/api/users/me/streak')
  Future<StreakResponse> getMyStreak();
}