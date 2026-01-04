// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Workout {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<WorkoutExerciseEntry> get exercises =>
      throw _privateConstructorUsedError;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res, Workout>;
  @useResult
  $Res call({
    int id,
    String name,
    String? description,
    DateTime createdAt,
    List<WorkoutExerciseEntry> exercises,
  });
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res, $Val extends Workout>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? exercises = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutExerciseEntry>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutImplCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$WorkoutImplCopyWith(
    _$WorkoutImpl value,
    $Res Function(_$WorkoutImpl) then,
  ) = __$$WorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String? description,
    DateTime createdAt,
    List<WorkoutExerciseEntry> exercises,
  });
}

/// @nodoc
class __$$WorkoutImplCopyWithImpl<$Res>
    extends _$WorkoutCopyWithImpl<$Res, _$WorkoutImpl>
    implements _$$WorkoutImplCopyWith<$Res> {
  __$$WorkoutImplCopyWithImpl(
    _$WorkoutImpl _value,
    $Res Function(_$WorkoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? exercises = null,
  }) {
    return _then(
      _$WorkoutImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutExerciseEntry>,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutImpl implements _Workout {
  const _$WorkoutImpl({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    final List<WorkoutExerciseEntry> exercises = const [],
  }) : _exercises = exercises;

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  final List<WorkoutExerciseEntry> _exercises;
  @override
  @JsonKey()
  List<WorkoutExerciseEntry> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'Workout(id: $id, name: $name, description: $description, createdAt: $createdAt, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    createdAt,
    const DeepCollectionEquality().hash(_exercises),
  );

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      __$$WorkoutImplCopyWithImpl<_$WorkoutImpl>(this, _$identity);
}

abstract class _Workout implements Workout {
  const factory _Workout({
    required final int id,
    required final String name,
    final String? description,
    required final DateTime createdAt,
    final List<WorkoutExerciseEntry> exercises,
  }) = _$WorkoutImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  List<WorkoutExerciseEntry> get exercises;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WorkoutExerciseEntry {
  int get id => throw _privateConstructorUsedError;
  int get exerciseId => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;
  int get targetSets => throw _privateConstructorUsedError;
  int get targetReps => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutExerciseEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutExerciseEntryCopyWith<WorkoutExerciseEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutExerciseEntryCopyWith<$Res> {
  factory $WorkoutExerciseEntryCopyWith(
    WorkoutExerciseEntry value,
    $Res Function(WorkoutExerciseEntry) then,
  ) = _$WorkoutExerciseEntryCopyWithImpl<$Res, WorkoutExerciseEntry>;
  @useResult
  $Res call({
    int id,
    int exerciseId,
    String exerciseName,
    int orderIndex,
    int targetSets,
    int targetReps,
  });
}

/// @nodoc
class _$WorkoutExerciseEntryCopyWithImpl<
  $Res,
  $Val extends WorkoutExerciseEntry
>
    implements $WorkoutExerciseEntryCopyWith<$Res> {
  _$WorkoutExerciseEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutExerciseEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? orderIndex = null,
    Object? targetSets = null,
    Object? targetReps = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            exerciseId: null == exerciseId
                ? _value.exerciseId
                : exerciseId // ignore: cast_nullable_to_non_nullable
                      as int,
            exerciseName: null == exerciseName
                ? _value.exerciseName
                : exerciseName // ignore: cast_nullable_to_non_nullable
                      as String,
            orderIndex: null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            targetSets: null == targetSets
                ? _value.targetSets
                : targetSets // ignore: cast_nullable_to_non_nullable
                      as int,
            targetReps: null == targetReps
                ? _value.targetReps
                : targetReps // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutExerciseEntryImplCopyWith<$Res>
    implements $WorkoutExerciseEntryCopyWith<$Res> {
  factory _$$WorkoutExerciseEntryImplCopyWith(
    _$WorkoutExerciseEntryImpl value,
    $Res Function(_$WorkoutExerciseEntryImpl) then,
  ) = __$$WorkoutExerciseEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int exerciseId,
    String exerciseName,
    int orderIndex,
    int targetSets,
    int targetReps,
  });
}

/// @nodoc
class __$$WorkoutExerciseEntryImplCopyWithImpl<$Res>
    extends _$WorkoutExerciseEntryCopyWithImpl<$Res, _$WorkoutExerciseEntryImpl>
    implements _$$WorkoutExerciseEntryImplCopyWith<$Res> {
  __$$WorkoutExerciseEntryImplCopyWithImpl(
    _$WorkoutExerciseEntryImpl _value,
    $Res Function(_$WorkoutExerciseEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutExerciseEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? orderIndex = null,
    Object? targetSets = null,
    Object? targetReps = null,
  }) {
    return _then(
      _$WorkoutExerciseEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        exerciseId: null == exerciseId
            ? _value.exerciseId
            : exerciseId // ignore: cast_nullable_to_non_nullable
                  as int,
        exerciseName: null == exerciseName
            ? _value.exerciseName
            : exerciseName // ignore: cast_nullable_to_non_nullable
                  as String,
        orderIndex: null == orderIndex
            ? _value.orderIndex
            : orderIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        targetSets: null == targetSets
            ? _value.targetSets
            : targetSets // ignore: cast_nullable_to_non_nullable
                  as int,
        targetReps: null == targetReps
            ? _value.targetReps
            : targetReps // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutExerciseEntryImpl implements _WorkoutExerciseEntry {
  const _$WorkoutExerciseEntryImpl({
    required this.id,
    required this.exerciseId,
    required this.exerciseName,
    required this.orderIndex,
    required this.targetSets,
    required this.targetReps,
  });

  @override
  final int id;
  @override
  final int exerciseId;
  @override
  final String exerciseName;
  @override
  final int orderIndex;
  @override
  final int targetSets;
  @override
  final int targetReps;

  @override
  String toString() {
    return 'WorkoutExerciseEntry(id: $id, exerciseId: $exerciseId, exerciseName: $exerciseName, orderIndex: $orderIndex, targetSets: $targetSets, targetReps: $targetReps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutExerciseEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.targetSets, targetSets) ||
                other.targetSets == targetSets) &&
            (identical(other.targetReps, targetReps) ||
                other.targetReps == targetReps));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    exerciseId,
    exerciseName,
    orderIndex,
    targetSets,
    targetReps,
  );

  /// Create a copy of WorkoutExerciseEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutExerciseEntryImplCopyWith<_$WorkoutExerciseEntryImpl>
  get copyWith =>
      __$$WorkoutExerciseEntryImplCopyWithImpl<_$WorkoutExerciseEntryImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkoutExerciseEntry implements WorkoutExerciseEntry {
  const factory _WorkoutExerciseEntry({
    required final int id,
    required final int exerciseId,
    required final String exerciseName,
    required final int orderIndex,
    required final int targetSets,
    required final int targetReps,
  }) = _$WorkoutExerciseEntryImpl;

  @override
  int get id;
  @override
  int get exerciseId;
  @override
  String get exerciseName;
  @override
  int get orderIndex;
  @override
  int get targetSets;
  @override
  int get targetReps;

  /// Create a copy of WorkoutExerciseEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutExerciseEntryImplCopyWith<_$WorkoutExerciseEntryImpl>
  get copyWith => throw _privateConstructorUsedError;
}
