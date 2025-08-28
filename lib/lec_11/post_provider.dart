import 'package:flutter_riverpod/flutter_riverpod.dart';

///Family Provider that takes an integer parameter and returns a modified value
final multiplierProvider = StateProvider.family<int, int>((ref, number) {
  return number * 2;
});
