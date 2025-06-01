// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalyticsResponse _$AnalyticsResponseFromJson(Map<String, dynamic> json) {
  return _AnalyticsResponse.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsResponse {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsResponseCopyWith<AnalyticsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsResponseCopyWith<$Res> {
  factory $AnalyticsResponseCopyWith(
          AnalyticsResponse value, $Res Function(AnalyticsResponse) then) =
      _$AnalyticsResponseCopyWithImpl<$Res, AnalyticsResponse>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class _$AnalyticsResponseCopyWithImpl<$Res, $Val extends AnalyticsResponse>
    implements $AnalyticsResponseCopyWith<$Res> {
  _$AnalyticsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsResponseImplCopyWith<$Res>
    implements $AnalyticsResponseCopyWith<$Res> {
  factory _$$AnalyticsResponseImplCopyWith(_$AnalyticsResponseImpl value,
          $Res Function(_$AnalyticsResponseImpl) then) =
      __$$AnalyticsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$AnalyticsResponseImplCopyWithImpl<$Res>
    extends _$AnalyticsResponseCopyWithImpl<$Res, _$AnalyticsResponseImpl>
    implements _$$AnalyticsResponseImplCopyWith<$Res> {
  __$$AnalyticsResponseImplCopyWithImpl(_$AnalyticsResponseImpl _value,
      $Res Function(_$AnalyticsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AnalyticsResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsResponseImpl implements _AnalyticsResponse {
  const _$AnalyticsResponseImpl({required final Map<String, dynamic> data})
      : _data = data;

  factory _$AnalyticsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsResponseImplFromJson(json);

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'AnalyticsResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of AnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsResponseImplCopyWith<_$AnalyticsResponseImpl> get copyWith =>
      __$$AnalyticsResponseImplCopyWithImpl<_$AnalyticsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsResponseImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsResponse implements AnalyticsResponse {
  const factory _AnalyticsResponse({required final Map<String, dynamic> data}) =
      _$AnalyticsResponseImpl;

  factory _AnalyticsResponse.fromJson(Map<String, dynamic> json) =
      _$AnalyticsResponseImpl.fromJson;

  @override
  Map<String, dynamic> get data;

  /// Create a copy of AnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsResponseImplCopyWith<_$AnalyticsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmotionSummary _$EmotionSummaryFromJson(Map<String, dynamic> json) {
  return _EmotionSummary.fromJson(json);
}

/// @nodoc
mixin _$EmotionSummary {
  Map<String, int> get emotionCounts => throw _privateConstructorUsedError;
  int get totalEntries => throw _privateConstructorUsedError;

  /// Serializes this EmotionSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmotionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmotionSummaryCopyWith<EmotionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionSummaryCopyWith<$Res> {
  factory $EmotionSummaryCopyWith(
          EmotionSummary value, $Res Function(EmotionSummary) then) =
      _$EmotionSummaryCopyWithImpl<$Res, EmotionSummary>;
  @useResult
  $Res call({Map<String, int> emotionCounts, int totalEntries});
}

/// @nodoc
class _$EmotionSummaryCopyWithImpl<$Res, $Val extends EmotionSummary>
    implements $EmotionSummaryCopyWith<$Res> {
  _$EmotionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmotionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotionCounts = null,
    Object? totalEntries = null,
  }) {
    return _then(_value.copyWith(
      emotionCounts: null == emotionCounts
          ? _value.emotionCounts
          : emotionCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      totalEntries: null == totalEntries
          ? _value.totalEntries
          : totalEntries // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmotionSummaryImplCopyWith<$Res>
    implements $EmotionSummaryCopyWith<$Res> {
  factory _$$EmotionSummaryImplCopyWith(_$EmotionSummaryImpl value,
          $Res Function(_$EmotionSummaryImpl) then) =
      __$$EmotionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, int> emotionCounts, int totalEntries});
}

/// @nodoc
class __$$EmotionSummaryImplCopyWithImpl<$Res>
    extends _$EmotionSummaryCopyWithImpl<$Res, _$EmotionSummaryImpl>
    implements _$$EmotionSummaryImplCopyWith<$Res> {
  __$$EmotionSummaryImplCopyWithImpl(
      _$EmotionSummaryImpl _value, $Res Function(_$EmotionSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmotionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotionCounts = null,
    Object? totalEntries = null,
  }) {
    return _then(_$EmotionSummaryImpl(
      emotionCounts: null == emotionCounts
          ? _value._emotionCounts
          : emotionCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      totalEntries: null == totalEntries
          ? _value.totalEntries
          : totalEntries // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmotionSummaryImpl implements _EmotionSummary {
  const _$EmotionSummaryImpl(
      {required final Map<String, int> emotionCounts,
      required this.totalEntries})
      : _emotionCounts = emotionCounts;

  factory _$EmotionSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmotionSummaryImplFromJson(json);

  final Map<String, int> _emotionCounts;
  @override
  Map<String, int> get emotionCounts {
    if (_emotionCounts is EqualUnmodifiableMapView) return _emotionCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_emotionCounts);
  }

  @override
  final int totalEntries;

  @override
  String toString() {
    return 'EmotionSummary(emotionCounts: $emotionCounts, totalEntries: $totalEntries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionSummaryImpl &&
            const DeepCollectionEquality()
                .equals(other._emotionCounts, _emotionCounts) &&
            (identical(other.totalEntries, totalEntries) ||
                other.totalEntries == totalEntries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_emotionCounts), totalEntries);

  /// Create a copy of EmotionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionSummaryImplCopyWith<_$EmotionSummaryImpl> get copyWith =>
      __$$EmotionSummaryImplCopyWithImpl<_$EmotionSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmotionSummaryImplToJson(
      this,
    );
  }
}

abstract class _EmotionSummary implements EmotionSummary {
  const factory _EmotionSummary(
      {required final Map<String, int> emotionCounts,
      required final int totalEntries}) = _$EmotionSummaryImpl;

  factory _EmotionSummary.fromJson(Map<String, dynamic> json) =
      _$EmotionSummaryImpl.fromJson;

  @override
  Map<String, int> get emotionCounts;
  @override
  int get totalEntries;

  /// Create a copy of EmotionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionSummaryImplCopyWith<_$EmotionSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyTrend _$DailyTrendFromJson(Map<String, dynamic> json) {
  return _DailyTrend.fromJson(json);
}

/// @nodoc
mixin _$DailyTrend {
  List<DailyData> get dailyData => throw _privateConstructorUsedError;

  /// Serializes this DailyTrend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyTrendCopyWith<DailyTrend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyTrendCopyWith<$Res> {
  factory $DailyTrendCopyWith(
          DailyTrend value, $Res Function(DailyTrend) then) =
      _$DailyTrendCopyWithImpl<$Res, DailyTrend>;
  @useResult
  $Res call({List<DailyData> dailyData});
}

/// @nodoc
class _$DailyTrendCopyWithImpl<$Res, $Val extends DailyTrend>
    implements $DailyTrendCopyWith<$Res> {
  _$DailyTrendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyData = null,
  }) {
    return _then(_value.copyWith(
      dailyData: null == dailyData
          ? _value.dailyData
          : dailyData // ignore: cast_nullable_to_non_nullable
              as List<DailyData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyTrendImplCopyWith<$Res>
    implements $DailyTrendCopyWith<$Res> {
  factory _$$DailyTrendImplCopyWith(
          _$DailyTrendImpl value, $Res Function(_$DailyTrendImpl) then) =
      __$$DailyTrendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DailyData> dailyData});
}

/// @nodoc
class __$$DailyTrendImplCopyWithImpl<$Res>
    extends _$DailyTrendCopyWithImpl<$Res, _$DailyTrendImpl>
    implements _$$DailyTrendImplCopyWith<$Res> {
  __$$DailyTrendImplCopyWithImpl(
      _$DailyTrendImpl _value, $Res Function(_$DailyTrendImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyData = null,
  }) {
    return _then(_$DailyTrendImpl(
      dailyData: null == dailyData
          ? _value._dailyData
          : dailyData // ignore: cast_nullable_to_non_nullable
              as List<DailyData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyTrendImpl implements _DailyTrend {
  const _$DailyTrendImpl({required final List<DailyData> dailyData})
      : _dailyData = dailyData;

  factory _$DailyTrendImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyTrendImplFromJson(json);

  final List<DailyData> _dailyData;
  @override
  List<DailyData> get dailyData {
    if (_dailyData is EqualUnmodifiableListView) return _dailyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyData);
  }

  @override
  String toString() {
    return 'DailyTrend(dailyData: $dailyData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyTrendImpl &&
            const DeepCollectionEquality()
                .equals(other._dailyData, _dailyData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_dailyData));

  /// Create a copy of DailyTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyTrendImplCopyWith<_$DailyTrendImpl> get copyWith =>
      __$$DailyTrendImplCopyWithImpl<_$DailyTrendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyTrendImplToJson(
      this,
    );
  }
}

abstract class _DailyTrend implements DailyTrend {
  const factory _DailyTrend({required final List<DailyData> dailyData}) =
      _$DailyTrendImpl;

  factory _DailyTrend.fromJson(Map<String, dynamic> json) =
      _$DailyTrendImpl.fromJson;

  @override
  List<DailyData> get dailyData;

  /// Create a copy of DailyTrend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyTrendImplCopyWith<_$DailyTrendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyData _$DailyDataFromJson(Map<String, dynamic> json) {
  return _DailyData.fromJson(json);
}

/// @nodoc
mixin _$DailyData {
  String get date => throw _privateConstructorUsedError;
  int get totalSugar => throw _privateConstructorUsedError;
  int get entryCount => throw _privateConstructorUsedError;

  /// Serializes this DailyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyDataCopyWith<DailyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyDataCopyWith<$Res> {
  factory $DailyDataCopyWith(DailyData value, $Res Function(DailyData) then) =
      _$DailyDataCopyWithImpl<$Res, DailyData>;
  @useResult
  $Res call({String date, int totalSugar, int entryCount});
}

/// @nodoc
class _$DailyDataCopyWithImpl<$Res, $Val extends DailyData>
    implements $DailyDataCopyWith<$Res> {
  _$DailyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalSugar = null,
    Object? entryCount = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalSugar: null == totalSugar
          ? _value.totalSugar
          : totalSugar // ignore: cast_nullable_to_non_nullable
              as int,
      entryCount: null == entryCount
          ? _value.entryCount
          : entryCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyDataImplCopyWith<$Res>
    implements $DailyDataCopyWith<$Res> {
  factory _$$DailyDataImplCopyWith(
          _$DailyDataImpl value, $Res Function(_$DailyDataImpl) then) =
      __$$DailyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, int totalSugar, int entryCount});
}

/// @nodoc
class __$$DailyDataImplCopyWithImpl<$Res>
    extends _$DailyDataCopyWithImpl<$Res, _$DailyDataImpl>
    implements _$$DailyDataImplCopyWith<$Res> {
  __$$DailyDataImplCopyWithImpl(
      _$DailyDataImpl _value, $Res Function(_$DailyDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalSugar = null,
    Object? entryCount = null,
  }) {
    return _then(_$DailyDataImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalSugar: null == totalSugar
          ? _value.totalSugar
          : totalSugar // ignore: cast_nullable_to_non_nullable
              as int,
      entryCount: null == entryCount
          ? _value.entryCount
          : entryCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyDataImpl implements _DailyData {
  const _$DailyDataImpl(
      {required this.date, required this.totalSugar, required this.entryCount});

  factory _$DailyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyDataImplFromJson(json);

  @override
  final String date;
  @override
  final int totalSugar;
  @override
  final int entryCount;

  @override
  String toString() {
    return 'DailyData(date: $date, totalSugar: $totalSugar, entryCount: $entryCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalSugar, totalSugar) ||
                other.totalSugar == totalSugar) &&
            (identical(other.entryCount, entryCount) ||
                other.entryCount == entryCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, totalSugar, entryCount);

  /// Create a copy of DailyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyDataImplCopyWith<_$DailyDataImpl> get copyWith =>
      __$$DailyDataImplCopyWithImpl<_$DailyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyDataImplToJson(
      this,
    );
  }
}

abstract class _DailyData implements DailyData {
  const factory _DailyData(
      {required final String date,
      required final int totalSugar,
      required final int entryCount}) = _$DailyDataImpl;

  factory _DailyData.fromJson(Map<String, dynamic> json) =
      _$DailyDataImpl.fromJson;

  @override
  String get date;
  @override
  int get totalSugar;
  @override
  int get entryCount;

  /// Create a copy of DailyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyDataImplCopyWith<_$DailyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeOfDayPattern _$TimeOfDayPatternFromJson(Map<String, dynamic> json) {
  return _TimeOfDayPattern.fromJson(json);
}

/// @nodoc
mixin _$TimeOfDayPattern {
  Map<String, double> get hourlyAverages => throw _privateConstructorUsedError;

  /// Serializes this TimeOfDayPattern to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeOfDayPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeOfDayPatternCopyWith<TimeOfDayPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeOfDayPatternCopyWith<$Res> {
  factory $TimeOfDayPatternCopyWith(
          TimeOfDayPattern value, $Res Function(TimeOfDayPattern) then) =
      _$TimeOfDayPatternCopyWithImpl<$Res, TimeOfDayPattern>;
  @useResult
  $Res call({Map<String, double> hourlyAverages});
}

/// @nodoc
class _$TimeOfDayPatternCopyWithImpl<$Res, $Val extends TimeOfDayPattern>
    implements $TimeOfDayPatternCopyWith<$Res> {
  _$TimeOfDayPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeOfDayPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourlyAverages = null,
  }) {
    return _then(_value.copyWith(
      hourlyAverages: null == hourlyAverages
          ? _value.hourlyAverages
          : hourlyAverages // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeOfDayPatternImplCopyWith<$Res>
    implements $TimeOfDayPatternCopyWith<$Res> {
  factory _$$TimeOfDayPatternImplCopyWith(_$TimeOfDayPatternImpl value,
          $Res Function(_$TimeOfDayPatternImpl) then) =
      __$$TimeOfDayPatternImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, double> hourlyAverages});
}

/// @nodoc
class __$$TimeOfDayPatternImplCopyWithImpl<$Res>
    extends _$TimeOfDayPatternCopyWithImpl<$Res, _$TimeOfDayPatternImpl>
    implements _$$TimeOfDayPatternImplCopyWith<$Res> {
  __$$TimeOfDayPatternImplCopyWithImpl(_$TimeOfDayPatternImpl _value,
      $Res Function(_$TimeOfDayPatternImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeOfDayPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourlyAverages = null,
  }) {
    return _then(_$TimeOfDayPatternImpl(
      hourlyAverages: null == hourlyAverages
          ? _value._hourlyAverages
          : hourlyAverages // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeOfDayPatternImpl implements _TimeOfDayPattern {
  const _$TimeOfDayPatternImpl(
      {required final Map<String, double> hourlyAverages})
      : _hourlyAverages = hourlyAverages;

  factory _$TimeOfDayPatternImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeOfDayPatternImplFromJson(json);

  final Map<String, double> _hourlyAverages;
  @override
  Map<String, double> get hourlyAverages {
    if (_hourlyAverages is EqualUnmodifiableMapView) return _hourlyAverages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_hourlyAverages);
  }

  @override
  String toString() {
    return 'TimeOfDayPattern(hourlyAverages: $hourlyAverages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeOfDayPatternImpl &&
            const DeepCollectionEquality()
                .equals(other._hourlyAverages, _hourlyAverages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_hourlyAverages));

  /// Create a copy of TimeOfDayPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeOfDayPatternImplCopyWith<_$TimeOfDayPatternImpl> get copyWith =>
      __$$TimeOfDayPatternImplCopyWithImpl<_$TimeOfDayPatternImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeOfDayPatternImplToJson(
      this,
    );
  }
}

abstract class _TimeOfDayPattern implements TimeOfDayPattern {
  const factory _TimeOfDayPattern(
          {required final Map<String, double> hourlyAverages}) =
      _$TimeOfDayPatternImpl;

  factory _TimeOfDayPattern.fromJson(Map<String, dynamic> json) =
      _$TimeOfDayPatternImpl.fromJson;

  @override
  Map<String, double> get hourlyAverages;

  /// Create a copy of TimeOfDayPattern
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeOfDayPatternImplCopyWith<_$TimeOfDayPatternImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyTotal _$MonthlyTotalFromJson(Map<String, dynamic> json) {
  return _MonthlyTotal.fromJson(json);
}

/// @nodoc
mixin _$MonthlyTotal {
  List<MonthlyData> get monthlyData => throw _privateConstructorUsedError;

  /// Serializes this MonthlyTotal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyTotal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyTotalCopyWith<MonthlyTotal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyTotalCopyWith<$Res> {
  factory $MonthlyTotalCopyWith(
          MonthlyTotal value, $Res Function(MonthlyTotal) then) =
      _$MonthlyTotalCopyWithImpl<$Res, MonthlyTotal>;
  @useResult
  $Res call({List<MonthlyData> monthlyData});
}

/// @nodoc
class _$MonthlyTotalCopyWithImpl<$Res, $Val extends MonthlyTotal>
    implements $MonthlyTotalCopyWith<$Res> {
  _$MonthlyTotalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyTotal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlyData = null,
  }) {
    return _then(_value.copyWith(
      monthlyData: null == monthlyData
          ? _value.monthlyData
          : monthlyData // ignore: cast_nullable_to_non_nullable
              as List<MonthlyData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyTotalImplCopyWith<$Res>
    implements $MonthlyTotalCopyWith<$Res> {
  factory _$$MonthlyTotalImplCopyWith(
          _$MonthlyTotalImpl value, $Res Function(_$MonthlyTotalImpl) then) =
      __$$MonthlyTotalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MonthlyData> monthlyData});
}

/// @nodoc
class __$$MonthlyTotalImplCopyWithImpl<$Res>
    extends _$MonthlyTotalCopyWithImpl<$Res, _$MonthlyTotalImpl>
    implements _$$MonthlyTotalImplCopyWith<$Res> {
  __$$MonthlyTotalImplCopyWithImpl(
      _$MonthlyTotalImpl _value, $Res Function(_$MonthlyTotalImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyTotal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlyData = null,
  }) {
    return _then(_$MonthlyTotalImpl(
      monthlyData: null == monthlyData
          ? _value._monthlyData
          : monthlyData // ignore: cast_nullable_to_non_nullable
              as List<MonthlyData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyTotalImpl implements _MonthlyTotal {
  const _$MonthlyTotalImpl({required final List<MonthlyData> monthlyData})
      : _monthlyData = monthlyData;

  factory _$MonthlyTotalImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyTotalImplFromJson(json);

  final List<MonthlyData> _monthlyData;
  @override
  List<MonthlyData> get monthlyData {
    if (_monthlyData is EqualUnmodifiableListView) return _monthlyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyData);
  }

  @override
  String toString() {
    return 'MonthlyTotal(monthlyData: $monthlyData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyTotalImpl &&
            const DeepCollectionEquality()
                .equals(other._monthlyData, _monthlyData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_monthlyData));

  /// Create a copy of MonthlyTotal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyTotalImplCopyWith<_$MonthlyTotalImpl> get copyWith =>
      __$$MonthlyTotalImplCopyWithImpl<_$MonthlyTotalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyTotalImplToJson(
      this,
    );
  }
}

abstract class _MonthlyTotal implements MonthlyTotal {
  const factory _MonthlyTotal({required final List<MonthlyData> monthlyData}) =
      _$MonthlyTotalImpl;

  factory _MonthlyTotal.fromJson(Map<String, dynamic> json) =
      _$MonthlyTotalImpl.fromJson;

  @override
  List<MonthlyData> get monthlyData;

  /// Create a copy of MonthlyTotal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyTotalImplCopyWith<_$MonthlyTotalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyData _$MonthlyDataFromJson(Map<String, dynamic> json) {
  return _MonthlyData.fromJson(json);
}

/// @nodoc
mixin _$MonthlyData {
  String get month => throw _privateConstructorUsedError;
  int get totalSugar => throw _privateConstructorUsedError;
  int get entryCount => throw _privateConstructorUsedError;

  /// Serializes this MonthlyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyDataCopyWith<MonthlyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyDataCopyWith<$Res> {
  factory $MonthlyDataCopyWith(
          MonthlyData value, $Res Function(MonthlyData) then) =
      _$MonthlyDataCopyWithImpl<$Res, MonthlyData>;
  @useResult
  $Res call({String month, int totalSugar, int entryCount});
}

/// @nodoc
class _$MonthlyDataCopyWithImpl<$Res, $Val extends MonthlyData>
    implements $MonthlyDataCopyWith<$Res> {
  _$MonthlyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? totalSugar = null,
    Object? entryCount = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      totalSugar: null == totalSugar
          ? _value.totalSugar
          : totalSugar // ignore: cast_nullable_to_non_nullable
              as int,
      entryCount: null == entryCount
          ? _value.entryCount
          : entryCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyDataImplCopyWith<$Res>
    implements $MonthlyDataCopyWith<$Res> {
  factory _$$MonthlyDataImplCopyWith(
          _$MonthlyDataImpl value, $Res Function(_$MonthlyDataImpl) then) =
      __$$MonthlyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, int totalSugar, int entryCount});
}

/// @nodoc
class __$$MonthlyDataImplCopyWithImpl<$Res>
    extends _$MonthlyDataCopyWithImpl<$Res, _$MonthlyDataImpl>
    implements _$$MonthlyDataImplCopyWith<$Res> {
  __$$MonthlyDataImplCopyWithImpl(
      _$MonthlyDataImpl _value, $Res Function(_$MonthlyDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? totalSugar = null,
    Object? entryCount = null,
  }) {
    return _then(_$MonthlyDataImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      totalSugar: null == totalSugar
          ? _value.totalSugar
          : totalSugar // ignore: cast_nullable_to_non_nullable
              as int,
      entryCount: null == entryCount
          ? _value.entryCount
          : entryCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyDataImpl implements _MonthlyData {
  const _$MonthlyDataImpl(
      {required this.month,
      required this.totalSugar,
      required this.entryCount});

  factory _$MonthlyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyDataImplFromJson(json);

  @override
  final String month;
  @override
  final int totalSugar;
  @override
  final int entryCount;

  @override
  String toString() {
    return 'MonthlyData(month: $month, totalSugar: $totalSugar, entryCount: $entryCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyDataImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.totalSugar, totalSugar) ||
                other.totalSugar == totalSugar) &&
            (identical(other.entryCount, entryCount) ||
                other.entryCount == entryCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month, totalSugar, entryCount);

  /// Create a copy of MonthlyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyDataImplCopyWith<_$MonthlyDataImpl> get copyWith =>
      __$$MonthlyDataImplCopyWithImpl<_$MonthlyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyDataImplToJson(
      this,
    );
  }
}

abstract class _MonthlyData implements MonthlyData {
  const factory _MonthlyData(
      {required final String month,
      required final int totalSugar,
      required final int entryCount}) = _$MonthlyDataImpl;

  factory _MonthlyData.fromJson(Map<String, dynamic> json) =
      _$MonthlyDataImpl.fromJson;

  @override
  String get month;
  @override
  int get totalSugar;
  @override
  int get entryCount;

  /// Create a copy of MonthlyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyDataImplCopyWith<_$MonthlyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
