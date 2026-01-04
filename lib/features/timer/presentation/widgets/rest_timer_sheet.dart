import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../providers/rest_timer_provider.dart';

class RestTimerSheet extends ConsumerWidget {
  const RestTimerSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(restTimerNotifierProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            timerState.isRunning ? 'Rest Timer' : 'Start Rest Timer',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          if (timerState.isRunning)
            _buildActiveTimer(context, ref, timerState)
          else
            _buildPresets(context, ref),
          const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveTimer(
      BuildContext context, WidgetRef ref, RestTimerState state) {
    final minutes = state.remainingSeconds ~/ 60;
    final seconds = state.remainingSeconds % 60;
    final progress =
        state.totalSeconds > 0 ? state.remainingSeconds / state.totalSeconds : 0.0;

    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[200],
                ),
              ),
              Text(
                '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () =>
                  ref.read(restTimerNotifierProvider.notifier).addTime(15),
              child: const Text('+15s'),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () =>
                  ref.read(restTimerNotifierProvider.notifier).addTime(30),
              child: const Text('+30s'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            ref.read(restTimerNotifierProvider.notifier).cancelTimer();
            Navigator.pop(context);
          },
          child: const Text('Skip Rest'),
        ),
      ],
    );
  }

  Widget _buildPresets(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: AppConstants.restPresets.map((seconds) {
            return SizedBox(
              width: 80,
              child: FilledButton(
                onPressed: () {
                  ref
                      .read(restTimerNotifierProvider.notifier)
                      .startTimer(seconds);
                },
                child: Text(_formatDuration(seconds)),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Skip Rest'),
        ),
      ],
    );
  }

  String _formatDuration(int seconds) {
    if (seconds < 60) return '${seconds}s';
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return secs == 0 ? '${minutes}m' : '${minutes}m ${secs}s';
  }
}
