import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/database_provider.dart';
import '../../domain/repositories/workout_repository.dart';
import 'workout_repository_impl.dart';

part 'workout_repository_provider.g.dart';

@riverpod
WorkoutRepository workoutRepository(WorkoutRepositoryRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return WorkoutRepositoryImpl(db);
}
