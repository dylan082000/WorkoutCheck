// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutDetailHash() => r'f312a4fd7a2f5d8302ae39f341dcf9cd757294f9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [workoutDetail].
@ProviderFor(workoutDetail)
const workoutDetailProvider = WorkoutDetailFamily();

/// See also [workoutDetail].
class WorkoutDetailFamily extends Family<AsyncValue<Workout?>> {
  /// See also [workoutDetail].
  const WorkoutDetailFamily();

  /// See also [workoutDetail].
  WorkoutDetailProvider call(int id) {
    return WorkoutDetailProvider(id);
  }

  @override
  WorkoutDetailProvider getProviderOverride(
    covariant WorkoutDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'workoutDetailProvider';
}

/// See also [workoutDetail].
class WorkoutDetailProvider extends AutoDisposeFutureProvider<Workout?> {
  /// See also [workoutDetail].
  WorkoutDetailProvider(int id)
    : this._internal(
        (ref) => workoutDetail(ref as WorkoutDetailRef, id),
        from: workoutDetailProvider,
        name: r'workoutDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$workoutDetailHash,
        dependencies: WorkoutDetailFamily._dependencies,
        allTransitiveDependencies:
            WorkoutDetailFamily._allTransitiveDependencies,
        id: id,
      );

  WorkoutDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Workout?> Function(WorkoutDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkoutDetailProvider._internal(
        (ref) => create(ref as WorkoutDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Workout?> createElement() {
    return _WorkoutDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WorkoutDetailRef on AutoDisposeFutureProviderRef<Workout?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WorkoutDetailProviderElement
    extends AutoDisposeFutureProviderElement<Workout?>
    with WorkoutDetailRef {
  _WorkoutDetailProviderElement(super.provider);

  @override
  int get id => (origin as WorkoutDetailProvider).id;
}

String _$workoutsNotifierHash() => r'07059281b715c0504c12a2cbdfe343975b3bd78f';

/// See also [WorkoutsNotifier].
@ProviderFor(WorkoutsNotifier)
final workoutsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<WorkoutsNotifier, List<Workout>>.internal(
      WorkoutsNotifier.new,
      name: r'workoutsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$workoutsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WorkoutsNotifier = AutoDisposeAsyncNotifier<List<Workout>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
