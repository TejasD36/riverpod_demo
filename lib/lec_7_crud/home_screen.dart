import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/lec_7_crud/provider/favourite_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod CRUD"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == "All") {
                ref.read(favouriteProvider.notifier).favList(false);
              } else if (value == "Favourites") {
                ref.read(favouriteProvider.notifier).favList(true);
              }
            },
            itemBuilder: (BuildContext context) {
              return const [PopupMenuItem(value: 'All', child: Text("All")), PopupMenuItem(value: 'Favourites', child: Text("Favourites"))];
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                ref.read(favouriteProvider.notifier).filterList(value);
              },
              decoration: InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final favouriteList = ref.watch(favouriteProvider.select((state) => state.filterItems));
                  if (favouriteList.isNotEmpty) {
                    return ListView.builder(
                      itemCount: favouriteList.length,
                      itemBuilder: (context, index) {
                        final item = favouriteList[index];
                        return ListTile(title: Text(item.name), trailing: Icon(item.isFav ? Icons.favorite : Icons.favorite_border));
                      },
                    );
                  } else {
                    return Center(child: Text("No Item Found"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
