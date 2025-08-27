import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///State Provider (Unlike simple provider the state can be changed for this provider)
final counter = StateProvider<int>((ref) {
  return 0;
});

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
