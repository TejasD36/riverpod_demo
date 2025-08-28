import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/lec_11/post_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int num = 2;
    return Scaffold(
      appBar: AppBar(title: Text("Family Builder Provider Example")),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(multiplierProvider(num));
          return Container(
            alignment: Alignment.center,
            child: Text(provider.toString(), style: TextStyle(fontSize: 30)),
          );
        },
      ),
    );
  }
}
