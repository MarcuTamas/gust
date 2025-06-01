import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class UserRankingResponse with _$UserRankingResponse {
  const factory UserRankingResponse({
    required String username,
    required int totalSugarGrams,
    int? rank,
  }) = _UserRankingResponse;

  factory UserRankingResponse.fromJson(Map<String, dynamic> json) => _$UserRankingResponseFromJson(json);
}

@freezed
class CommunityRankings with _$CommunityRankings {
  const factory CommunityRankings({
    required List<UserRankingResponse> rankings,
    required String period,
  }) = _CommunityRankings;

  factory CommunityRankings.fromJson(Map<String, dynamic> json) => _$CommunityRankingsFromJson(json);
}
