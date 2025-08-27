import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//region Riverpod Example to read value (Not able to change state)
///To read const value
final hello = Provider<String>((ref) {
  return "Begining of Riverpod Tutorial";
});

final age = Provider<int>((ref) {
  return 28;
});

///Stateless Widget Example
/*class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hi = ref.watch(hello);
    final tempAge = ref.watch(age);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("$hi $tempAge", style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
      ),
    );
  }
}*/

///Stateful Widget Example
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final hi = ref.watch(hello);
    final tempAge = ref.watch(age);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("$hi $tempAge", style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
      ),
    );
  }
}

//endregion Riverpod Example to read value (Not able to change state)
