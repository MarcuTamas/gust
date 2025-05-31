import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class UserRanking with _$UserRanking {
  const factory UserRanking({
    required int rank,
    required String fullName,
    required int streakDays,
    required int totalLogs,
    required double averageSugar,
    @Default(false) bool isCurrentUser,
  }) = _UserRanking;

  factory UserRanking.fromJson(Map<String, dynamic> json) => _$UserRankingFromJson(json);
}

@freezed
class RankingsResponse with _$RankingsResponse {
  const factory RankingsResponse({
    required List<UserRanking> rankings,
    UserRanking? currentUserRank,
    required String period,
    required int totalParticipants,
  }) = _RankingsResponse;

  factory RankingsResponse.fromJson(Map<String, dynamic> json) => _$RankingsResponseFromJson(json);
}

@freezed
class StreakResponse with _$StreakResponse {
  const factory StreakResponse({
    required int streak,
  }) = _StreakResponse;

  factory StreakResponse.fromJson(Map<String, dynamic> json) => _$StreakResponseFromJson(json);
}