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
  @POST('/auth/register')
  Future<AuthResponse> register(@Body() RegisterRequest request);

  @POST('/auth/login')
  Future<AuthResponse> login(@Body() LoginRequest request);

  // Sugar Log endpoints
  @POST('/api/sugar-logs')
  Future<SugarLogResponse> createLog(@Body() SugarLogRequest request);

  @GET('/api/sugar-logs')
  Future<List<SugarLogResponse>> getAllLogs();

  @GET('/api/sugar-logs/by-date')
  Future<List<SugarLogResponse>> getLogsByDate(@Query('date') String date);

  @GET('/api/sugar-logs/{id}')
  Future<SugarLogResponse> getLogById(@Path('id') int id);

  @PUT('/api/sugar-logs/{id}')
  Future<SugarLogResponse> updateLog(@Path('id') int id, @Body() SugarLogRequest request);

  @DELETE('/api/sugar-logs/{id}')
  Future<void> deleteLog(@Path('id') int id);

  // Analytics endpoints
  @GET('/analytics/emotion-summary')
  Future<AnalyticsResponse> getEmotionSummary(
    @Query('month') int month,
    @Query('year') int year,
  );

  @GET('/analytics/daily-trend')
  Future<AnalyticsResponse> getDailyTrend(
    @Query('month') int month,
    @Query('year') int year,
  );

  @GET('/analytics/time-of-day-pattern')
  Future<AnalyticsResponse> getTimeOfDayPattern();

  @GET('/analytics/monthly-total')
  Future<AnalyticsResponse> getMonthlyTotals();

  @GET('/analytics/export/csv')
  Future<List<int>> exportCsv();

  // Community endpoints
  @GET('/community/rankings')
  Future<List<UserRankingResponse>> getRankings(@Query('period') String period);

  // User endpoints
  @GET('/user/streak')
  Future<StreakResponse> getMyStreak();
}
