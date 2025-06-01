// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRankingResponse _$UserRankingResponseFromJson(Map<String, dynamic> json) {
  return _UserRankingResponse.fromJson(json);
}

/// @nodoc
mixin _$UserRankingResponse {
  String get username => throw _privateConstructorUsedError;
  int get totalSugarGrams => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;

  /// Serializes this UserRankingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRankingResponseCopyWith<UserRankingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRankingResponseCopyWith<$Res> {
  factory $UserRankingResponseCopyWith(
          UserRankingResponse value, $Res Function(UserRankingResponse) then) =
      _$UserRankingResponseCopyWithImpl<$Res, UserRankingResponse>;
  @useResult
  $Res call({String username, int totalSugarGrams, int? rank});
}

/// @nodoc
class _$UserRankingResponseCopyWithImpl<$Res, $Val extends UserRankingResponse>
    implements $UserRankingResponseCopyWith<$Res> {
  _$UserRankingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? totalSugarGrams = null,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      totalSugarGrams: null == totalSugarGrams
          ? _value.totalSugarGrams
          : totalSugarGrams // ignore: cast_nullable_to_non_nullable
              as int,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRankingResponseImplCopyWith<$Res>
    implements $UserRankingResponseCopyWith<$Res> {
  factory _$$UserRankingResponseImplCopyWith(_$UserRankingResponseImpl value,
          $Res Function(_$UserRankingResponseImpl) then) =
      __$$UserRankingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, int totalSugarGrams, int? rank});
}

/// @nodoc
class __$$UserRankingResponseImplCopyWithImpl<$Res>
    extends _$UserRankingResponseCopyWithImpl<$Res, _$UserRankingResponseImpl>
    implements _$$UserRankingResponseImplCopyWith<$Res> {
  __$$UserRankingResponseImplCopyWithImpl(_$UserRankingResponseImpl _value,
      $Res Function(_$UserRankingResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? totalSugarGrams = null,
    Object? rank = freezed,
  }) {
    return _then(_$UserRankingResponseImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      totalSugarGrams: null == totalSugarGrams
          ? _value.totalSugarGrams
          : totalSugarGrams // ignore: cast_nullable_to_non_nullable
              as int,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRankingResponseImpl implements _UserRankingResponse {
  const _$UserRankingResponseImpl(
      {required this.username, required this.totalSugarGrams, this.rank});

  factory _$UserRankingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRankingResponseImplFromJson(json);

  @override
  final String username;
  @override
  final int totalSugarGrams;
  @override
  final int? rank;

  @override
  String toString() {
    return 'UserRankingResponse(username: $username, totalSugarGrams: $totalSugarGrams, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRankingResponseImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.totalSugarGrams, totalSugarGrams) ||
                other.totalSugarGrams == totalSugarGrams) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, totalSugarGrams, rank);

  /// Create a copy of UserRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRankingResponseImplCopyWith<_$UserRankingResponseImpl> get copyWith =>
      __$$UserRankingResponseImplCopyWithImpl<_$UserRankingResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRankingResponseImplToJson(
      this,
    );
  }
}

abstract class _UserRankingResponse implements UserRankingResponse {
  const factory _UserRankingResponse(
      {required final String username,
      required final int totalSugarGrams,
      final int? rank}) = _$UserRankingResponseImpl;

  factory _UserRankingResponse.fromJson(Map<String, dynamic> json) =
      _$UserRankingResponseImpl.fromJson;

  @override
  String get username;
  @override
  int get totalSugarGrams;
  @override
  int? get rank;

  /// Create a copy of UserRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRankingResponseImplCopyWith<_$UserRankingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommunityRankings _$CommunityRankingsFromJson(Map<String, dynamic> json) {
  return _CommunityRankings.fromJson(json);
}

/// @nodoc
mixin _$CommunityRankings {
  List<UserRankingResponse> get rankings => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;

  /// Serializes this CommunityRankings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunityRankings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityRankingsCopyWith<CommunityRankings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityRankingsCopyWith<$Res> {
  factory $CommunityRankingsCopyWith(
          CommunityRankings value, $Res Function(CommunityRankings) then) =
      _$CommunityRankingsCopyWithImpl<$Res, CommunityRankings>;
  @useResult
  $Res call({List<UserRankingResponse> rankings, String period});
}

/// @nodoc
class _$CommunityRankingsCopyWithImpl<$Res, $Val extends CommunityRankings>
    implements $CommunityRankingsCopyWith<$Res> {
  _$CommunityRankingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityRankings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankings = null,
    Object? period = null,
  }) {
    return _then(_value.copyWith(
      rankings: null == rankings
          ? _value.rankings
          : rankings // ignore: cast_nullable_to_non_nullable
              as List<UserRankingResponse>,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityRankingsImplCopyWith<$Res>
    implements $CommunityRankingsCopyWith<$Res> {
  factory _$$CommunityRankingsImplCopyWith(_$CommunityRankingsImpl value,
          $Res Function(_$CommunityRankingsImpl) then) =
      __$$CommunityRankingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserRankingResponse> rankings, String period});
}

/// @nodoc
class __$$CommunityRankingsImplCopyWithImpl<$Res>
    extends _$CommunityRankingsCopyWithImpl<$Res, _$CommunityRankingsImpl>
    implements _$$CommunityRankingsImplCopyWith<$Res> {
  __$$CommunityRankingsImplCopyWithImpl(_$CommunityRankingsImpl _value,
      $Res Function(_$CommunityRankingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityRankings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankings = null,
    Object? period = null,
  }) {
    return _then(_$CommunityRankingsImpl(
      rankings: null == rankings
          ? _value._rankings
          : rankings // ignore: cast_nullable_to_non_nullable
              as List<UserRankingResponse>,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityRankingsImpl implements _CommunityRankings {
  const _$CommunityRankingsImpl(
      {required final List<UserRankingResponse> rankings, required this.period})
      : _rankings = rankings;

  factory _$CommunityRankingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityRankingsImplFromJson(json);

  final List<UserRankingResponse> _rankings;
  @override
  List<UserRankingResponse> get rankings {
    if (_rankings is EqualUnmodifiableListView) return _rankings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rankings);
  }

  @override
  final String period;

  @override
  String toString() {
    return 'CommunityRankings(rankings: $rankings, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityRankingsImpl &&
            const DeepCollectionEquality().equals(other._rankings, _rankings) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_rankings), period);

  /// Create a copy of CommunityRankings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityRankingsImplCopyWith<_$CommunityRankingsImpl> get copyWith =>
      __$$CommunityRankingsImplCopyWithImpl<_$CommunityRankingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityRankingsImplToJson(
      this,
    );
  }
}

abstract class _CommunityRankings implements CommunityRankings {
  const factory _CommunityRankings(
      {required final List<UserRankingResponse> rankings,
      required final String period}) = _$CommunityRankingsImpl;

  factory _CommunityRankings.fromJson(Map<String, dynamic> json) =
      _$CommunityRankingsImpl.fromJson;

  @override
  List<UserRankingResponse> get rankings;
  @override
  String get period;

  /// Create a copy of CommunityRankings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityRankingsImplCopyWith<_$CommunityRankingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
