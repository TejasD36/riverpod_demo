import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/lec_9/stream_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Stream Provider Example")),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(stockPriceProvider);
          return Container(
            alignment: Alignment.center,
            child: provider.when(
              data: (price) => Text(price.toString(), style: TextStyle(fontSize: 30)),
              error: (error, stack) => TextButton(
                onPressed: () {
                  ref.invalidate(stockPriceProvider);
                },
                child: Text("Error: ${error.toString()}", style: TextStyle(fontSize: 30)),
              ),
              loading: () => CircularProgressIndicator(),
              skipLoadingOnRefresh: false,
            ),
          );
        },
      ),
    );
  }
}
