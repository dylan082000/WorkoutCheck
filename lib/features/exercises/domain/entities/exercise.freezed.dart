// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Exercise {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get muscleGroup => throw _privateConstructorUsedError;
  String? get equipment => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;
  bool get isSystemExercise => throw _privateConstructorUsedError;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res, Exercise>;
  @useResult
  $Res call({
    int id,
    String name,
    String muscleGroup,
    String? equipment,
    String? instructions,
    bool isSystemExercise,
  });
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res, $Val extends Exercise>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? muscleGroup = null,
    Object? equipment = freezed,
    Object? instructions = freezed,
    Object? isSystemExercise = null,
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
            muscleGroup: null == muscleGroup
                ? _value.muscleGroup
                : muscleGroup // ignore: cast_nullable_to_non_nullable
                      as String,
            equipment: freezed == equipment
                ? _value.equipment
                : equipment // ignore: cast_nullable_to_non_nullable
                      as String?,
            instructions: freezed == instructions
                ? _value.instructions
                : instructions // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSystemExercise: null == isSystemExercise
                ? _value.isSystemExercise
                : isSystemExercise // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseImplCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
    _$ExerciseImpl value,
    $Res Function(_$ExerciseImpl) then,
  ) = __$$ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String muscleGroup,
    String? equipment,
    String? instructions,
    bool isSystemExercise,
  });
}

/// @nodoc
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ExerciseCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
    _$ExerciseImpl _value,
    $Res Function(_$ExerciseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? muscleGroup = null,
    Object? equipment = freezed,
    Object? instructions = freezed,
    Object? isSystemExercise = null,
  }) {
    return _then(
      _$ExerciseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        muscleGroup: null == muscleGroup
            ? _value.muscleGroup
            : muscleGroup // ignore: cast_nullable_to_non_nullable
                  as String,
        equipment: freezed == equipment
            ? _value.equipment
            : equipment // ignore: cast_nullable_to_non_nullable
                  as String?,
        instructions: freezed == instructions
            ? _value.instructions
            : instructions // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSystemExercise: null == isSystemExercise
            ? _value.isSystemExercise
            : isSystemExercise // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ExerciseImpl implements _Exercise {
  const _$ExerciseImpl({
    required this.id,
    required this.name,
    required this.muscleGroup,
    this.equipment,
    this.instructions,
    this.isSystemExercise = false,
  });

  @override
  final int id;
  @override
  final String name;
  @override
  final String muscleGroup;
  @override
  final String? equipment;
  @override
  final String? instructions;
  @override
  @JsonKey()
  final bool isSystemExercise;

  @override
  String toString() {
    return 'Exercise(id: $id, name: $name, muscleGroup: $muscleGroup, equipment: $equipment, instructions: $instructions, isSystemExercise: $isSystemExercise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.muscleGroup, muscleGroup) ||
                other.muscleGroup == muscleGroup) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.isSystemExercise, isSystemExercise) ||
                other.isSystemExercise == isSystemExercise));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    muscleGroup,
    equipment,
    instructions,
    isSystemExercise,
  );

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);
}

abstract class _Exercise implements Exercise {
  const factory _Exercise({
    required final int id,
    required final String name,
    required final String muscleGroup,
    final String? equipment,
    final String? instructions,
    final bool isSystemExercise,
  }) = _$ExerciseImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get muscleGroup;
  @override
  String? get equipment;
  @override
  String? get instructions;
  @override
  bool get isSystemExercise;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
