// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_timer_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RestTimerState {
  bool get isRunning => throw _privateConstructorUsedError;
  int get totalSeconds => throw _privateConstructorUsedError;
  int get remainingSeconds => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;

  /// Create a copy of RestTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestTimerStateCopyWith<RestTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestTimerStateCopyWith<$Res> {
  factory $RestTimerStateCopyWith(
    RestTimerState value,
    $Res Function(RestTimerState) then,
  ) = _$RestTimerStateCopyWithImpl<$Res, RestTimerState>;
  @useResult
  $Res call({
    bool isRunning,
    int totalSeconds,
    int remainingSeconds,
    DateTime? startedAt,
  });
}

/// @nodoc
class _$RestTimerStateCopyWithImpl<$Res, $Val extends RestTimerState>
    implements $RestTimerStateCopyWith<$Res> {
  _$RestTimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestTimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRunning = null,
    Object? totalSeconds = null,
    Object? remainingSeconds = null,
    Object? startedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            isRunning: null == isRunning
                ? _value.isRunning
                : isRunning // ignore: cast_nullable_to_non_nullable
                      as bool,
            totalSeconds: null == totalSeconds
                ? _value.totalSeconds
                : totalSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            remainingSeconds: null == remainingSeconds
                ? _value.remainingSeconds
                : remainingSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RestTimerStateImplCopyWith<$Res>
    implements $RestTimerStateCopyWith<$Res> {
  factory _$$RestTimerStateImplCopyWith(
    _$RestTimerStateImpl value,
    $Res Function(_$RestTimerStateImpl) then,
  ) = __$$RestTimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isRunning,
    int totalSeconds,
    int remainingSeconds,
    DateTime? startedAt,
  });
}

/// @nodoc
class __$$RestTimerStateImplCopyWithImpl<$Res>
    extends _$RestTimerStateCopyWithImpl<$Res, _$RestTimerStateImpl>
    implements _$$RestTimerStateImplCopyWith<$Res> {
  __$$RestTimerStateImplCopyWithImpl(
    _$RestTimerStateImpl _value,
    $Res Function(_$RestTimerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RestTimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRunning = null,
    Object? totalSeconds = null,
    Object? remainingSeconds = null,
    Object? startedAt = freezed,
  }) {
    return _then(
      _$RestTimerStateImpl(
        isRunning: null == isRunning
            ? _value.isRunning
            : isRunning // ignore: cast_nullable_to_non_nullable
                  as bool,
        totalSeconds: null == totalSeconds
            ? _value.totalSeconds
            : totalSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        remainingSeconds: null == remainingSeconds
            ? _value.remainingSeconds
            : remainingSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$RestTimerStateImpl
    with DiagnosticableTreeMixin
    implements _RestTimerState {
  const _$RestTimerStateImpl({
    this.isRunning = false,
    this.totalSeconds = 0,
    this.remainingSeconds = 0,
    this.startedAt,
  });

  @override
  @JsonKey()
  final bool isRunning;
  @override
  @JsonKey()
  final int totalSeconds;
  @override
  @JsonKey()
  final int remainingSeconds;
  @override
  final DateTime? startedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RestTimerState(isRunning: $isRunning, totalSeconds: $totalSeconds, remainingSeconds: $remainingSeconds, startedAt: $startedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RestTimerState'))
      ..add(DiagnosticsProperty('isRunning', isRunning))
      ..add(DiagnosticsProperty('totalSeconds', totalSeconds))
      ..add(DiagnosticsProperty('remainingSeconds', remainingSeconds))
      ..add(DiagnosticsProperty('startedAt', startedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestTimerStateImpl &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning) &&
            (identical(other.totalSeconds, totalSeconds) ||
                other.totalSeconds == totalSeconds) &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isRunning,
    totalSeconds,
    remainingSeconds,
    startedAt,
  );

  /// Create a copy of RestTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestTimerStateImplCopyWith<_$RestTimerStateImpl> get copyWith =>
      __$$RestTimerStateImplCopyWithImpl<_$RestTimerStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RestTimerState implements RestTimerState {
  const factory _RestTimerState({
    final bool isRunning,
    final int totalSeconds,
    final int remainingSeconds,
    final DateTime? startedAt,
  }) = _$RestTimerStateImpl;

  @override
  bool get isRunning;
  @override
  int get totalSeconds;
  @override
  int get remainingSeconds;
  @override
  DateTime? get startedAt;

  /// Create a copy of RestTimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestTimerStateImplCopyWith<_$RestTimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
