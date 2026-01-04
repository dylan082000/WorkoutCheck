import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/workout_repository_provider.dart';
import '../../domain/entities/workout_session.dart';

part 'history_provider.g.dart';

@riverpod
Future<List<WorkoutSession>> completedSessions(CompletedSessionsRef ref) async {
  return ref.watch(workoutRepositoryProvider).getCompletedSessions();
}
