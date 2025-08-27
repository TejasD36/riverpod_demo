import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider = StateProvider<AppState>((ref) {
  return AppState(sliderValue: 0.5, showPassword: false);
});

class AppState {
  final double sliderValue;
  final bool showPassword;
  AppState({required this.sliderValue, required this.showPassword});

  AppState copyWith({double? sliderValue, bool? showPassword}) {
    return AppState(sliderValue: sliderValue ?? this.sliderValue, showPassword: showPassword ?? this.showPassword);
  }
}
