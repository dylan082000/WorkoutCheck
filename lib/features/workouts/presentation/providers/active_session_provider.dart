import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/workout_repository_provider.dart';
import '../../domain/entities/workout_session.dart';
import 'history_provider.dart';

part 'active_session_provider.g.dart';

@riverpod
class ActiveSessionNotifier extends _$ActiveSessionNotifier {
  @override
  Future<WorkoutSession?> build() async {
    return ref.watch(workoutRepositoryProvider).getActiveSession();
  }

  Future<void> startSession(int workoutId) async {
    final repo = ref.read(workoutRepositoryProvider);
    await repo.startSession(workoutId);
    ref.invalidateSelf();
  }

  Future<void> logSet({
    required int exerciseId,
    required int setNumber,
    required int reps,
    required double weight,
  }) async {
    final session = state.valueOrNull;
    if (session == null) return;

    final repo = ref.read(workoutRepositoryProvider);
    await repo.logSet(session.id, exerciseId, setNumber, reps, weight);
    ref.invalidateSelf();
  }

  Future<void> markSetComplete(int setId) async {
    await ref.read(workoutRepositoryProvider).markSetComplete(setId);
    ref.invalidateSelf();
  }

  Future<void> updateSet(int setId, int reps, double weight) async {
    await ref.read(workoutRepositoryProvider).updateSet(setId, reps, weight);
    ref.invalidateSelf();
  }

  Future<void> deleteSet(int setId) async {
    await ref.read(workoutRepositoryProvider).deleteSet(setId);
    ref.invalidateSelf();
  }

  Future<void> completeSession({String? notes}) async {
    final session = state.valueOrNull;
    if (session == null) return;

    await ref
        .read(workoutRepositoryProvider)
        .completeSession(session.id, notes: notes);
    // Invalidate history provider so the completed session appears in history
    ref.invalidate(completedSessionsProvider);
    ref.invalidateSelf();
  }

  Future<void> cancelSession() async {
    final session = state.valueOrNull;
    if (session == null) return;

    await ref.read(workoutRepositoryProvider).cancelSession(session.id);
    ref.invalidateSelf();
  }
}
