// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRankingResponseImpl _$$UserRankingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRankingResponseImpl(
      username: json['username'] as String,
      totalSugarGrams: (json['totalSugarGrams'] as num).toInt(),
      rank: (json['rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserRankingResponseImplToJson(
        _$UserRankingResponseImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'totalSugarGrams': instance.totalSugarGrams,
      'rank': instance.rank,
    };

_$CommunityRankingsImpl _$$CommunityRankingsImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityRankingsImpl(
      rankings: (json['rankings'] as List<dynamic>)
          .map((e) => UserRankingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      period: json['period'] as String,
    );

Map<String, dynamic> _$$CommunityRankingsImplToJson(
        _$CommunityRankingsImpl instance) =>
    <String, dynamic>{
      'rankings': instance.rankings,
      'period': instance.period,
    };
