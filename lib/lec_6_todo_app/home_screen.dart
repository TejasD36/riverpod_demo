import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item.dart';
import 'item_provider.dart';

//region TODO App using State Notifier Provider from Riverpod
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App")),
      body: Consumer(
        builder: (context, ref, child) {
          final items = ref.watch(itemProvider);
          if (items != null && items.isNotEmpty) {
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final Item item = items[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref.read(itemProvider.notifier).editItem(item.id, "Lec");
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(itemProvider.notifier).deleteItem(item.id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No Item Found"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem("New Item");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//endregion TODO App using State Notifier Provider from Riverpod
