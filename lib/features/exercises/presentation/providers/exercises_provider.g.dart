// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exercisesNotifierHash() => r'33350c4bc9acee9ca408b381623f8083a42babd5';

/// See also [ExercisesNotifier].
@ProviderFor(ExercisesNotifier)
final exercisesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      ExercisesNotifier,
      List<Exercise>
    >.internal(
      ExercisesNotifier.new,
      name: r'exercisesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$exercisesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ExercisesNotifier = AutoDisposeAsyncNotifier<List<Exercise>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
