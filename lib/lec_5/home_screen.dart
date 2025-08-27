import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/lec_5/search_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("State Notifier Provider example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print("Text rebuild");
              final search = ref.watch(searchProvider.select((state) => state.query));
              return Text(search);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch(searchProvider.select((state) => state.isChange));
              print("Switch rebuild :${search.toString()}");

              return Switch(
                value: search,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).onChange(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
