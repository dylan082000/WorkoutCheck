import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../features/workouts/presentation/pages/workouts_page.dart';
import '../features/workouts/presentation/pages/workout_detail_page.dart';
import '../features/workouts/presentation/pages/active_session_page.dart';
import '../features/workouts/presentation/pages/history_page.dart';
import '../features/exercises/presentation/pages/exercise_library_page.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: '/workouts',
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/workouts',
            builder: (context, state) => const WorkoutsPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return WorkoutDetailPage(workoutId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/exercises',
            builder: (context, state) {
              final select = state.uri.queryParameters['select'] == 'true';
              final workoutIdStr = state.uri.queryParameters['workoutId'];
              final workoutId =
                  workoutIdStr != null ? int.tryParse(workoutIdStr) : null;
              return ExerciseLibraryPage(
                selectMode: select,
                workoutId: workoutId,
              );
            },
          ),
          GoRoute(
            path: '/history',
            builder: (context, state) => const HistoryPage(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Settings'))),
          ),
        ],
      ),
      GoRoute(
        path: '/session/active',
        builder: (context, state) => const ActiveSessionPage(),
      ),
    ],
  );
}

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _getIndex(GoRouterState.of(context).uri.path),
        onDestinationSelected: (index) => _navigate(context, index),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.fitness_center), label: 'Workouts'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Exercises'),
          NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  int _getIndex(String path) {
    if (path.startsWith('/workouts')) return 0;
    if (path.startsWith('/exercises')) return 1;
    if (path.startsWith('/history')) return 2;
    if (path.startsWith('/settings')) return 3;
    return 0;
  }

  void _navigate(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/workouts');
      case 1:
        context.go('/exercises');
      case 2:
        context.go('/history');
      case 3:
        context.go('/settings');
    }
  }
}
