import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibration/vibration.dart';

part 'rest_timer_provider.freezed.dart';
part 'rest_timer_provider.g.dart';

@freezed
class RestTimerState with _$RestTimerState {
  const factory RestTimerState({
    @Default(false) bool isRunning,
    @Default(0) int totalSeconds,
    @Default(0) int remainingSeconds,
    DateTime? startedAt,
  }) = _RestTimerState;
}

@riverpod
class RestTimerNotifier extends _$RestTimerNotifier
    with WidgetsBindingObserver {
  Timer? _timer;
  DateTime? _pausedAt;

  @override
  RestTimerState build() {
    ref.onDispose(() {
      _timer?.cancel();
      WidgetsBinding.instance.removeObserver(this);
    });
    WidgetsBinding.instance.addObserver(this);
    return const RestTimerState();
  }

  void startTimer(int seconds) {
    _timer?.cancel();
    state = RestTimerState(
      isRunning: true,
      totalSeconds: seconds,
      remainingSeconds: seconds,
      startedAt: DateTime.now(),
    );
    _startTicking();
  }

  void _startTicking() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.remainingSeconds <= 1) {
        _onTimerComplete();
      } else {
        state = state.copyWith(remainingSeconds: state.remainingSeconds - 1);
      }
    });
  }

  void _onTimerComplete() {
    _timer?.cancel();
    _vibrate();
    state = const RestTimerState();
  }

  void cancelTimer() {
    _timer?.cancel();
    state = const RestTimerState();
  }

  void addTime(int seconds) {
    if (!state.isRunning) return;
    state = state.copyWith(
      remainingSeconds: state.remainingSeconds + seconds,
      totalSeconds: state.totalSeconds + seconds,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!this.state.isRunning) return;

    if (state == AppLifecycleState.paused) {
      _pausedAt = DateTime.now();
      _timer?.cancel();
    } else if (state == AppLifecycleState.resumed && _pausedAt != null) {
      final elapsed = DateTime.now().difference(_pausedAt!).inSeconds;
      final newRemaining = this.state.remainingSeconds - elapsed;

      if (newRemaining <= 0) {
        _onTimerComplete();
      } else {
        this.state = this.state.copyWith(remainingSeconds: newRemaining);
        _startTicking();
      }
      _pausedAt = null;
    }
  }

  Future<void> _vibrate() async {
    final hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator == true) {
      Vibration.vibrate(duration: 500, amplitude: 128);
    }
  }
}
