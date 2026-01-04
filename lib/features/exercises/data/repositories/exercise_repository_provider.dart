import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/database_provider.dart';
import '../../domain/repositories/exercise_repository.dart';
import 'exercise_repository_impl.dart';

part 'exercise_repository_provider.g.dart';

@riverpod
ExerciseRepository exerciseRepository(ExerciseRepositoryRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return ExerciseRepositoryImpl(db);
}
