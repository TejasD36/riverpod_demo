import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/lec_10/post_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Get API with Stream Provider")),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(postProvider);
          return provider.when(
            data: (posts) => ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(posts[index].title.toString()), subtitle: Text(posts[index].body.toString()));
              },
            ),
            error: (error, stack) => TextButton(
              onPressed: () {
                ref.invalidate(postProvider);
              },
              child: Text("Error: ${error.toString()}"),
            ),
            loading: () => CircularProgressIndicator(),
            skipLoadingOnRefresh: false,
          );
        },
      ),
    );
  }
}
