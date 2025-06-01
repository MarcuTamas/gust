// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sugar_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SugarLog _$SugarLogFromJson(Map<String, dynamic> json) {
  return _SugarLog.fromJson(json);
}

/// @nodoc
mixin _$SugarLog {
  int get id => throw _privateConstructorUsedError;
  int get sugarGrams => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get sugarType => throw _privateConstructorUsedError;
  String? get contextNote => throw _privateConstructorUsedError;
  Emotion get emotion => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  bool get wasCraving => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;

  /// Serializes this SugarLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SugarLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SugarLogCopyWith<SugarLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SugarLogCopyWith<$Res> {
  factory $SugarLogCopyWith(SugarLog value, $Res Function(SugarLog) then) =
      _$SugarLogCopyWithImpl<$Res, SugarLog>;
  @useResult
  $Res call(
      {int id,
      int sugarGrams,
      DateTime date,
      int hour,
      int minute,
      String productName,
      String sugarType,
      String? contextNote,
      Emotion emotion,
      String? location,
      bool wasCraving,
      int? userId});
}

/// @nodoc
class _$SugarLogCopyWithImpl<$Res, $Val extends SugarLog>
    implements $SugarLogCopyWith<$Res> {
  _$SugarLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SugarLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sugarGrams = null,
    Object? date = null,
    Object? hour = null,
    Object? minute = null,
    Object? productName = null,
    Object? sugarType = null,
    Object? contextNote = freezed,
    Object? emotion = null,
    Object? location = freezed,
    Object? wasCraving = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sugarGrams: null == sugarGrams
          ? _value.sugarGrams
          : sugarGrams // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      sugarType: null == sugarType
          ? _value.sugarType
          : sugarType // ignore: cast_nullable_to_non_nullable
              as String,
      contextNote: freezed == contextNote
          ? _value.contextNote
          : contextNote // ignore: cast_nullable_to_non_nullable
              as String?,
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as Emotion,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      wasCraving: null == wasCraving
          ? _value.wasCraving
          : wasCraving // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SugarLogImplCopyWith<$Res>
    implements $SugarLogCopyWith<$Res> {
  factory _$$SugarLogImplCopyWith(
          _$SugarLogImpl value, $Res Function(_$SugarLogImpl) then) =
      __$$SugarLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int sugarGrams,
      DateTime date,
      int hour,
      int minute,
      String productName,
      String sugarType,
      String? contextNote,
      Emotion emotion,
      String? location,
      bool wasCraving,
      int? userId});
}

/// @nodoc
class __$$SugarLogImplCopyWithImpl<$Res>
    extends _$SugarLogCopyWithImpl<$Res, _$SugarLogImpl>
    implements _$$SugarLogImplCopyWith<$Res> {
  __$$SugarLogImplCopyWithImpl(
      _$SugarLogImpl _value, $Res Function(_$SugarLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of SugarLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sugarGrams = null,
    Object? date = null,
    Object? hour = null,
    Object? minute = null,
    Object? productName = null,
    Object? sugarType = null,
    Object? contextNote = freezed,
    Object? emotion = null,
    Object? location = freezed,
    Object? wasCraving = null,
    Object? userId = freezed,
  }) {
    return _then(_$SugarLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sugarGrams: null == sugarGrams
          ? _value.sugarGrams
          : sugarGrams // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      sugarType: null == sugarType
          ? _value.sugarType
          : sugarType // ignore: cast_nullable_to_non_nullable
              as String,
      contextNote: freezed == contextNote
          ? _value.contextNote
          : contextNote // ignore: cast_nullable_to_non_nullable
              as String?,
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as Emotion,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      wasCraving: null == wasCraving
          ? _value.wasCraving
          : wasCraving // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SugarLogImpl implements _SugarLog {
  const _$SugarLogImpl(
      {required this.id,
      required this.sugarGrams,
      required this.date,
      required this.hour,
      required this.minute,
      required this.productName,
      required this.sugarType,
      this.contextNote,
      required this.emotion,
      this.location,
      this.wasCraving = false,
      this.userId});

  factory _$SugarLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$SugarLogImplFromJson(json);

  @override
  final int id;
  @override
  final int sugarGrams;
  @override
  final DateTime date;
  @override
  final int hour;
  @override
  final int minute;
  @override
  final String productName;
  @override
  final String sugarType;
  @override
  final String? contextNote;
  @override
  final Emotion emotion;
  @override
  final String? location;
  @override
  @JsonKey()
  final bool wasCraving;
  @override
  final int? userId;

  @override
  String toString() {
    return 'SugarLog(id: $id, sugarGrams: $sugarGrams, date: $date, hour: $hour, minute: $minute, productName: $productName, sugarType: $sugarType, contextNote: $contextNote, emotion: $emotion, location: $location, wasCraving: $wasCraving, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SugarLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sugarGrams, sugarGrams) ||
                other.sugarGrams == sugarGrams) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sugarType, sugarType) ||
                other.sugarType == sugarType) &&
            (identical(other.contextNote, contextNote) ||
                other.contextNote == contextNote) &&
            (identical(other.emotion, emotion) || other.emotion == emotion) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.wasCraving, wasCraving) ||
                other.wasCraving == wasCraving) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sugarGrams,
      date,
      hour,
      minute,
      productName,
      sugarType,
      contextNote,
      emotion,
      location,
      wasCraving,
      userId);

  /// Create a copy of SugarLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SugarLogImplCopyWith<_$SugarLogImpl> get copyWith =>
      __$$SugarLogImplCopyWithImpl<_$SugarLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SugarLogImplToJson(
      this,
    );
  }
}

abstract class _SugarLog implements SugarLog {
  const factory _SugarLog(
      {required final int id,
      required final int sugarGrams,
      required final DateTime date,
      required final int hour,
      required final int minute,
      required final String productName,
      required final String sugarType,
      final String? contextNote,
      required final Emotion emotion,
      final String? location,
      final bool wasCraving,
      final int? userId}) = _$SugarLogImpl;

  factory _SugarLog.fromJson(Map<String, dynamic> json) =
      _$SugarLogImpl.fromJson;

  @override
  int get id;
  @override
  int get sugarGrams;
  @override
  DateTime get date;
  @override
  int get hour;
  @override
  int get minute;
  @override
  String get productName;
  @override
  String get sugarType;
  @override
  String? get contextNote;
  @override
  Emotion get emotion;
  @override
  String? get location;
  @override
  bool get wasCraving;
  @override
  int? get userId;

  /// Create a copy of SugarLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SugarLogImplCopyWith<_$SugarLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SugarLogRequest _$SugarLogRequestFromJson(Map<String, dynamic> json) {
  return _SugarLogRequest.fromJson(json);
}

/// @nodoc
mixin _$SugarLogRequest {
  int get sugarGrams => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError; // Format: YYYY-MM-DD
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get sugarType => throw _privateConstructorUsedError;
  String? get contextNote => throw _privateConstructorUsedError;
  String get emotion =>
      throw _privateConstructorUsedError; // String for backend
  String? get location => throw _privateConstructorUsedError;
  bool get wasCraving => throw _privateConstructorUsedError;

  /// Serializes this SugarLogRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SugarLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SugarLogRequestCopyWith<SugarLogRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SugarLogRequestCopyWith<$Res> {
  factory $SugarLogRequestCopyWith(
          SugarLogRequest value, $Res Function(SugarLogRequest) then) =
      _$SugarLogRequestCopyWithImpl<$Res, SugarLogRequest>;
  @useResult
  $Res call(
      {int sugarGrams,
      String date,
      int hour,
      int minute,
      String productName,
      String sugarType,
      String? contextNote,
      String emotion,
      String? location,
      bool wasCraving});
}

/// @nodoc
class _$SugarLogRequestCopyWithImpl<$Res, $Val extends SugarLogRequest>
    implements $SugarLogRequestCopyWith<$Res> {
  _$SugarLogRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SugarLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sugarGrams = null,
    Object? date = null,
    Object? hour = null,
    Object? minute = null,
    Object? productName = null,
    Object? sugarType = null,
    Object? contextNote = freezed,
    Object? emotion = null,
    Object? location = freezed,
    Object? wasCraving = null,
  }) {
    return _then(_value.copyWith(
      sugarGrams: null == sugarGrams
          ? _value.sugarGrams
          : sugarGrams // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      sugarType: null == sugarType
          ? _value.sugarType
          : sugarType // ignore: cast_nullable_to_non_nullable
              as String,
      contextNote: freezed == contextNote
          ? _value.contextNote
          : contextNote // ignore: cast_nullable_to_non_nullable
              as String?,
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      wasCraving: null == wasCraving
          ? _value.wasCraving
          : wasCraving // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SugarLogRequestImplCopyWith<$Res>
    implements $SugarLogRequestCopyWith<$Res> {
  factory _$$SugarLogRequestImplCopyWith(_$SugarLogRequestImpl value,
          $Res Function(_$SugarLogRequestImpl) then) =
      __$$SugarLogRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int sugarGrams,
      String date,
      int hour,
      int minute,
      String productName,
      String sugarType,
      String? contextNote,
      String emotion,
      String? location,
      bool wasCraving});
}

/// @nodoc
class __$$SugarLogRequestImplCopyWithImpl<$Res>
    extends _$SugarLogRequestCopyWithImpl<$Res, _$SugarLogRequestImpl>
    implements _$$SugarLogRequestImplCopyWith<$Res> {
  __$$SugarLogRequestImplCopyWithImpl(
      _$SugarLogRequestImpl _value, $Res Function(_$SugarLogRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SugarLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sugarGrams = null,
    Object? date = null,
    Object? hour = null,
    Object? minute = null,
    Object? productName = null,
    Object? sugarType = null,
    Object? contextNote = freezed,
    Object? emotion = null,
    Object? location = freezed,
    Object? wasCraving = null,
  }) {
    return _then(_$SugarLogRequestImpl(
      sugarGrams: null == sugarGrams
          ? _value.sugarGrams
          : sugarGrams // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      sugarType: null == sugarType
          ? _value.sugarType
          : sugarType // ignore: cast_nullable_to_non_nullable
              as String,
      contextNote: freezed == contextNote
          ? _value.contextNote
          : contextNote // ignore: cast_nullable_to_non_nullable
              as String?,
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      wasCraving: null == wasCraving
          ? _value.wasCraving
          : wasCraving // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SugarLogRequestImpl implements _SugarLogRequest {
  const _$SugarLogRequestImpl(
      {required this.sugarGrams,
      required this.date,
      required this.hour,
      required this.minute,
      required this.productName,
      required this.sugarType,
      this.contextNote,
      required this.emotion,
      this.location,
      this.wasCraving = false});

  factory _$SugarLogRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SugarLogRequestImplFromJson(json);

  @override
  final int sugarGrams;
  @override
  final String date;
// Format: YYYY-MM-DD
  @override
  final int hour;
  @override
  final int minute;
  @override
  final String productName;
  @override
  final String sugarType;
  @override
  final String? contextNote;
  @override
  final String emotion;
// String for backend
  @override
  final String? location;
  @override
  @JsonKey()
  final bool wasCraving;

  @override
  String toString() {
    return 'SugarLogRequest(sugarGrams: $sugarGrams, date: $date, hour: $hour, minute: $minute, productName: $productName, sugarType: $sugarType, contextNote: $contextNote, emotion: $emotion, location: $location, wasCraving: $wasCraving)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SugarLogRequestImpl &&
            (identical(other.sugarGrams, sugarGrams) ||
                other.sugarGrams == sugarGrams) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sugarType, sugarType) ||
                other.sugarType == sugarType) &&
            (identical(other.contextNote, contextNote) ||
                other.contextNote == contextNote) &&
            (identical(other.emotion, emotion) || other.emotion == emotion) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.wasCraving, wasCraving) ||
                other.wasCraving == wasCraving));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sugarGrams, date, hour, minute,
      productName, sugarType, contextNote, emotion, location, wasCraving);

  /// Create a copy of SugarLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SugarLogRequestImplCopyWith<_$SugarLogRequestImpl> get copyWith =>
      __$$SugarLogRequestImplCopyWithImpl<_$SugarLogRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SugarLogRequestImplToJson(
      this,
    );
  }
}

abstract class _SugarLogRequest implements SugarLogRequest {
  const factory _SugarLogRequest(
      {required final int sugarGrams,
      required final String date,
      required final int hour,
      required final int minute,
      required final String productName,
      required final String sugarType,
      final String? contextNote,
      required final String emotion,
      final String? location,
      final bool wasCraving}) = _$SugarLogRequestImpl;

  factory _SugarLogRequest.fromJson(Map<String, dynamic> json) =
      _$SugarLogRequestImpl.fromJson;

  @override
  int get sugarGrams;
  @override
  String get date; // Format: YYYY-MM-DD
  @override
  int get hour;
  @override
  int get minute;
  @override
  String get productName;
  @override
  String get sugarType;
  @override
  String? get contextNote;
  @override
  String get emotion; // String for backend
  @override
  String? get location;
  @override
  bool get wasCraving;

  /// Create a copy of SugarLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SugarLogRequestImplCopyWith<_$SugarLogRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SugarLogResponse _$SugarLogResponseFromJson(Map<String, dynamic> json) {
  return _SugarLogResponse.fromJson(json);
}

/// @nodoc
mixin _$SugarLogResponse {
  int get id => throw _privateConstructorUsedError;
  int get sugarGrams => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get sugarType => throw _privateConstructorUsedError;
  String? get contextNote => throw _privateConstructorUsedError;
  String get emotion => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  bool get wasCraving => throw _privateConstructorUsedError;

  /// Serializes this SugarLogResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SugarLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SugarLogResponseCopyWith<SugarLogResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SugarLogResponseCopyWith<$Res> {
  factory $SugarLogResponseCopyWith(
          SugarLogResponse value, $Res Function(SugarLogResponse) then) =
      _$SugarLogResponseCopyWithImpl<$Res, SugarLogResponse>;
  @useResult
  $Res call(
      {int id,
      int sugarGrams,
      String date,
      int hour,
      int minute,
      String productName,
      String sugarType,
      String? contextNote,
      String emotion,
      String? location,
      bool wasCraving});
}

/// @nodoc
class _$SugarLogResponseCopyWithImpl<$Res, $Val extends SugarLogResponse>
    implements $SugarLogResponseCopyWith<$Res> {
  _$SugarLogResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SugarLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sugarGrams = null,
    Object? date = null,
    Object? hour = null,
    Object? minute = null,
    Object? productName = null,
    Object? sugarType = null,
    Object? contextNote = freezed,
    Object? emotion = null,
    Object? location = freezed,
    Object? wasCraving = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sugarGrams: null == sugarGrams
          ? _value.sugarGrams
          : sugarGrams // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      sugarType: null == sugarType
          ? _value.sugarType
          : sugarType // ignore: cast_nullable_to_non_nullable
              as String,
      contextNote: freezed == contextNote
          ? _value.contextNote
          : contextNote // ignore: cast_nullable_to_non_nullable
              as String?,
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      wasCraving: null == wasCraving
          ? _value.wasCraving
          : wasCraving // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SugarLogResponseImplCopyWith<$Res>
    implements $SugarLogResponseCopyWith<$Res> {
  factory _$$SugarLogResponseImplCopyWith(_$SugarLogResponseImpl value,
          $Res Function(_$SugarLogResponseImpl) then) =
      __$$SugarLogResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int sugarGrams,
      String date,
      int hour,
      int minute,
      String productName,
      String sugarType,
      String? contextNote,
      String emotion,
      String? location,
      bool wasCraving});
}

/// @nodoc
class __$$SugarLogResponseImplCopyWithImpl<$Res>
    extends _$SugarLogResponseCopyWithImpl<$Res, _$SugarLogResponseImpl>
    implements _$$SugarLogResponseImplCopyWith<$Res> {
  __$$SugarLogResponseImplCopyWithImpl(_$SugarLogResponseImpl _value,
      $Res Function(_$SugarLogResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SugarLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sugarGrams = null,
    Object? date = null,
    Object? hour = null,
    Object? minute = null,
    Object? productName = null,
    Object? sugarType = null,
    Object? contextNote = freezed,
    Object? emotion = null,
    Object? location = freezed,
    Object? wasCraving = null,
  }) {
    return _then(_$SugarLogResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sugarGrams: null == sugarGrams
          ? _value.sugarGrams
          : sugarGrams // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      sugarType: null == sugarType
          ? _value.sugarType
          : sugarType // ignore: cast_nullable_to_non_nullable
              as String,
      contextNote: freezed == contextNote
          ? _value.contextNote
          : contextNote // ignore: cast_nullable_to_non_nullable
              as String?,
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      wasCraving: null == wasCraving
          ? _value.wasCraving
          : wasCraving // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SugarLogResponseImpl implements _SugarLogResponse {
  const _$SugarLogResponseImpl(
      {required this.id,
      required this.sugarGrams,
      required this.date,
      required this.hour,
      required this.minute,
      required this.productName,
      required this.sugarType,
      this.contextNote,
      required this.emotion,
      this.location,
      this.wasCraving = false});

  factory _$SugarLogResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SugarLogResponseImplFromJson(json);

  @override
  final int id;
  @override
  final int sugarGrams;
  @override
  final String date;
  @override
  final int hour;
  @override
  final int minute;
  @override
  final String productName;
  @override
  final String sugarType;
  @override
  final String? contextNote;
  @override
  final String emotion;
  @override
  final String? location;
  @override
  @JsonKey()
  final bool wasCraving;

  @override
  String toString() {
    return 'SugarLogResponse(id: $id, sugarGrams: $sugarGrams, date: $date, hour: $hour, minute: $minute, productName: $productName, sugarType: $sugarType, contextNote: $contextNote, emotion: $emotion, location: $location, wasCraving: $wasCraving)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SugarLogResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sugarGrams, sugarGrams) ||
                other.sugarGrams == sugarGrams) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.sugarType, sugarType) ||
                other.sugarType == sugarType) &&
            (identical(other.contextNote, contextNote) ||
                other.contextNote == contextNote) &&
            (identical(other.emotion, emotion) || other.emotion == emotion) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.wasCraving, wasCraving) ||
                other.wasCraving == wasCraving));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sugarGrams,
      date,
      hour,
      minute,
      productName,
      sugarType,
      contextNote,
      emotion,
      location,
      wasCraving);

  /// Create a copy of SugarLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SugarLogResponseImplCopyWith<_$SugarLogResponseImpl> get copyWith =>
      __$$SugarLogResponseImplCopyWithImpl<_$SugarLogResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SugarLogResponseImplToJson(
      this,
    );
  }
}

abstract class _SugarLogResponse implements SugarLogResponse {
  const factory _SugarLogResponse(
      {required final int id,
      required final int sugarGrams,
      required final String date,
      required final int hour,
      required final int minute,
      required final String productName,
      required final String sugarType,
      final String? contextNote,
      required final String emotion,
      final String? location,
      final bool wasCraving}) = _$SugarLogResponseImpl;

  factory _SugarLogResponse.fromJson(Map<String, dynamic> json) =
      _$SugarLogResponseImpl.fromJson;

  @override
  int get id;
  @override
  int get sugarGrams;
  @override
  String get date;
  @override
  int get hour;
  @override
  int get minute;
  @override
  String get productName;
  @override
  String get sugarType;
  @override
  String? get contextNote;
  @override
  String get emotion;
  @override
  String? get location;
  @override
  bool get wasCraving;

  /// Create a copy of SugarLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SugarLogResponseImplCopyWith<_$SugarLogResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
