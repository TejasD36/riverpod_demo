import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/lec_8/future_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Future Provider example")),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(futureProvider);
          return Center(
            child: provider.when(
              // data: (value) => Text(value.toString(), style: TextStyle(fontSize: 30)),
              data: (value) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Text(value[index], style: TextStyle(fontSize: 30));
                },
              ),
              error: (error, stack) => Text(error.toString()),
              loading: () => CircularProgressIndicator(),
              skipLoadingOnRefresh: false,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///Use to refresh the value of FutureProvider
          ref.invalidate(futureProvider);
        },
      ),
    );
  }
}
