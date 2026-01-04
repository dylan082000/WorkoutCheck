// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkoutSession {
  int get id => throw _privateConstructorUsedError;
  int get workoutId => throw _privateConstructorUsedError;
  String get workoutName => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<SessionExercise> get exercises => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSessionCopyWith<WorkoutSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionCopyWith<$Res> {
  factory $WorkoutSessionCopyWith(
    WorkoutSession value,
    $Res Function(WorkoutSession) then,
  ) = _$WorkoutSessionCopyWithImpl<$Res, WorkoutSession>;
  @useResult
  $Res call({
    int id,
    int workoutId,
    String workoutName,
    DateTime startedAt,
    DateTime? completedAt,
    String? notes,
    List<SessionExercise> exercises,
  });
}

/// @nodoc
class _$WorkoutSessionCopyWithImpl<$Res, $Val extends WorkoutSession>
    implements $WorkoutSessionCopyWith<$Res> {
  _$WorkoutSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutId = null,
    Object? workoutName = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? notes = freezed,
    Object? exercises = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            workoutId: null == workoutId
                ? _value.workoutId
                : workoutId // ignore: cast_nullable_to_non_nullable
                      as int,
            workoutName: null == workoutName
                ? _value.workoutName
                : workoutName // ignore: cast_nullable_to_non_nullable
                      as String,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<SessionExercise>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSessionImplCopyWith<$Res>
    implements $WorkoutSessionCopyWith<$Res> {
  factory _$$WorkoutSessionImplCopyWith(
    _$WorkoutSessionImpl value,
    $Res Function(_$WorkoutSessionImpl) then,
  ) = __$$WorkoutSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int workoutId,
    String workoutName,
    DateTime startedAt,
    DateTime? completedAt,
    String? notes,
    List<SessionExercise> exercises,
  });
}

/// @nodoc
class __$$WorkoutSessionImplCopyWithImpl<$Res>
    extends _$WorkoutSessionCopyWithImpl<$Res, _$WorkoutSessionImpl>
    implements _$$WorkoutSessionImplCopyWith<$Res> {
  __$$WorkoutSessionImplCopyWithImpl(
    _$WorkoutSessionImpl _value,
    $Res Function(_$WorkoutSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutId = null,
    Object? workoutName = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? notes = freezed,
    Object? exercises = null,
  }) {
    return _then(
      _$WorkoutSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        workoutId: null == workoutId
            ? _value.workoutId
            : workoutId // ignore: cast_nullable_to_non_nullable
                  as int,
        workoutName: null == workoutName
            ? _value.workoutName
            : workoutName // ignore: cast_nullable_to_non_nullable
                  as String,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<SessionExercise>,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutSessionImpl implements _WorkoutSession {
  const _$WorkoutSessionImpl({
    required this.id,
    required this.workoutId,
    required this.workoutName,
    required this.startedAt,
    this.completedAt,
    this.notes,
    final List<SessionExercise> exercises = const [],
  }) : _exercises = exercises;

  @override
  final int id;
  @override
  final int workoutId;
  @override
  final String workoutName;
  @override
  final DateTime startedAt;
  @override
  final DateTime? completedAt;
  @override
  final String? notes;
  final List<SessionExercise> _exercises;
  @override
  @JsonKey()
  List<SessionExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkoutSession(id: $id, workoutId: $workoutId, workoutName: $workoutName, startedAt: $startedAt, completedAt: $completedAt, notes: $notes, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.workoutName, workoutName) ||
                other.workoutName == workoutName) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    workoutId,
    workoutName,
    startedAt,
    completedAt,
    notes,
    const DeepCollectionEquality().hash(_exercises),
  );

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionImplCopyWith<_$WorkoutSessionImpl> get copyWith =>
      __$$WorkoutSessionImplCopyWithImpl<_$WorkoutSessionImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkoutSession implements WorkoutSession {
  const factory _WorkoutSession({
    required final int id,
    required final int workoutId,
    required final String workoutName,
    required final DateTime startedAt,
    final DateTime? completedAt,
    final String? notes,
    final List<SessionExercise> exercises,
  }) = _$WorkoutSessionImpl;

  @override
  int get id;
  @override
  int get workoutId;
  @override
  String get workoutName;
  @override
  DateTime get startedAt;
  @override
  DateTime? get completedAt;
  @override
  String? get notes;
  @override
  List<SessionExercise> get exercises;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionImplCopyWith<_$WorkoutSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionExercise {
  int get exerciseId => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  List<ExerciseSetLog> get sets => throw _privateConstructorUsedError;

  /// Create a copy of SessionExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionExerciseCopyWith<SessionExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionExerciseCopyWith<$Res> {
  factory $SessionExerciseCopyWith(
    SessionExercise value,
    $Res Function(SessionExercise) then,
  ) = _$SessionExerciseCopyWithImpl<$Res, SessionExercise>;
  @useResult
  $Res call({int exerciseId, String exerciseName, List<ExerciseSetLog> sets});
}

/// @nodoc
class _$SessionExerciseCopyWithImpl<$Res, $Val extends SessionExercise>
    implements $SessionExerciseCopyWith<$Res> {
  _$SessionExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? sets = null,
  }) {
    return _then(
      _value.copyWith(
            exerciseId: null == exerciseId
                ? _value.exerciseId
                : exerciseId // ignore: cast_nullable_to_non_nullable
                      as int,
            exerciseName: null == exerciseName
                ? _value.exerciseName
                : exerciseName // ignore: cast_nullable_to_non_nullable
                      as String,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as List<ExerciseSetLog>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SessionExerciseImplCopyWith<$Res>
    implements $SessionExerciseCopyWith<$Res> {
  factory _$$SessionExerciseImplCopyWith(
    _$SessionExerciseImpl value,
    $Res Function(_$SessionExerciseImpl) then,
  ) = __$$SessionExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int exerciseId, String exerciseName, List<ExerciseSetLog> sets});
}

/// @nodoc
class __$$SessionExerciseImplCopyWithImpl<$Res>
    extends _$SessionExerciseCopyWithImpl<$Res, _$SessionExerciseImpl>
    implements _$$SessionExerciseImplCopyWith<$Res> {
  __$$SessionExerciseImplCopyWithImpl(
    _$SessionExerciseImpl _value,
    $Res Function(_$SessionExerciseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? sets = null,
  }) {
    return _then(
      _$SessionExerciseImpl(
        exerciseId: null == exerciseId
            ? _value.exerciseId
            : exerciseId // ignore: cast_nullable_to_non_nullable
                  as int,
        exerciseName: null == exerciseName
            ? _value.exerciseName
            : exerciseName // ignore: cast_nullable_to_non_nullable
                  as String,
        sets: null == sets
            ? _value._sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as List<ExerciseSetLog>,
      ),
    );
  }
}

/// @nodoc

class _$SessionExerciseImpl implements _SessionExercise {
  const _$SessionExerciseImpl({
    required this.exerciseId,
    required this.exerciseName,
    final List<ExerciseSetLog> sets = const [],
  }) : _sets = sets;

  @override
  final int exerciseId;
  @override
  final String exerciseName;
  final List<ExerciseSetLog> _sets;
  @override
  @JsonKey()
  List<ExerciseSetLog> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  String toString() {
    return 'SessionExercise(exerciseId: $exerciseId, exerciseName: $exerciseName, sets: $sets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionExerciseImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            const DeepCollectionEquality().equals(other._sets, _sets));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    exerciseId,
    exerciseName,
    const DeepCollectionEquality().hash(_sets),
  );

  /// Create a copy of SessionExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionExerciseImplCopyWith<_$SessionExerciseImpl> get copyWith =>
      __$$SessionExerciseImplCopyWithImpl<_$SessionExerciseImpl>(
        this,
        _$identity,
      );
}

abstract class _SessionExercise implements SessionExercise {
  const factory _SessionExercise({
    required final int exerciseId,
    required final String exerciseName,
    final List<ExerciseSetLog> sets,
  }) = _$SessionExerciseImpl;

  @override
  int get exerciseId;
  @override
  String get exerciseName;
  @override
  List<ExerciseSetLog> get sets;

  /// Create a copy of SessionExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionExerciseImplCopyWith<_$SessionExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExerciseSetLog {
  int get id => throw _privateConstructorUsedError;
  int get setNumber => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseSetLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseSetLogCopyWith<ExerciseSetLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseSetLogCopyWith<$Res> {
  factory $ExerciseSetLogCopyWith(
    ExerciseSetLog value,
    $Res Function(ExerciseSetLog) then,
  ) = _$ExerciseSetLogCopyWithImpl<$Res, ExerciseSetLog>;
  @useResult
  $Res call({
    int id,
    int setNumber,
    int reps,
    double weight,
    bool completed,
    DateTime? completedAt,
  });
}

/// @nodoc
class _$ExerciseSetLogCopyWithImpl<$Res, $Val extends ExerciseSetLog>
    implements $ExerciseSetLogCopyWith<$Res> {
  _$ExerciseSetLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseSetLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? setNumber = null,
    Object? reps = null,
    Object? weight = null,
    Object? completed = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            setNumber: null == setNumber
                ? _value.setNumber
                : setNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            reps: null == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double,
            completed: null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                      as bool,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseSetLogImplCopyWith<$Res>
    implements $ExerciseSetLogCopyWith<$Res> {
  factory _$$ExerciseSetLogImplCopyWith(
    _$ExerciseSetLogImpl value,
    $Res Function(_$ExerciseSetLogImpl) then,
  ) = __$$ExerciseSetLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int setNumber,
    int reps,
    double weight,
    bool completed,
    DateTime? completedAt,
  });
}

/// @nodoc
class __$$ExerciseSetLogImplCopyWithImpl<$Res>
    extends _$ExerciseSetLogCopyWithImpl<$Res, _$ExerciseSetLogImpl>
    implements _$$ExerciseSetLogImplCopyWith<$Res> {
  __$$ExerciseSetLogImplCopyWithImpl(
    _$ExerciseSetLogImpl _value,
    $Res Function(_$ExerciseSetLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseSetLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? setNumber = null,
    Object? reps = null,
    Object? weight = null,
    Object? completed = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _$ExerciseSetLogImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        setNumber: null == setNumber
            ? _value.setNumber
            : setNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: null == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double,
        completed: null == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as bool,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$ExerciseSetLogImpl implements _ExerciseSetLog {
  const _$ExerciseSetLogImpl({
    required this.id,
    required this.setNumber,
    required this.reps,
    required this.weight,
    required this.completed,
    this.completedAt,
  });

  @override
  final int id;
  @override
  final int setNumber;
  @override
  final int reps;
  @override
  final double weight;
  @override
  final bool completed;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'ExerciseSetLog(id: $id, setNumber: $setNumber, reps: $reps, weight: $weight, completed: $completed, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseSetLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.setNumber, setNumber) ||
                other.setNumber == setNumber) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    setNumber,
    reps,
    weight,
    completed,
    completedAt,
  );

  /// Create a copy of ExerciseSetLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseSetLogImplCopyWith<_$ExerciseSetLogImpl> get copyWith =>
      __$$ExerciseSetLogImplCopyWithImpl<_$ExerciseSetLogImpl>(
        this,
        _$identity,
      );
}

abstract class _ExerciseSetLog implements ExerciseSetLog {
  const factory _ExerciseSetLog({
    required final int id,
    required final int setNumber,
    required final int reps,
    required final double weight,
    required final bool completed,
    final DateTime? completedAt,
  }) = _$ExerciseSetLogImpl;

  @override
  int get id;
  @override
  int get setNumber;
  @override
  int get reps;
  @override
  double get weight;
  @override
  bool get completed;
  @override
  DateTime? get completedAt;

  /// Create a copy of ExerciseSetLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseSetLogImplCopyWith<_$ExerciseSetLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
