import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItem(String name) {
    final item = Item(id: DateTime.now().toString(), name: name);
    state.add(item);
    state = state.toList();
  }

  void deleteItem(String id) {
    state.removeWhere((element) => element.id == id);
    state = state.toList();
  }

  void editItem(String id, String name) {
    int index = state.indexWhere((element) => element.id == id);
    state[index].name = name;
    state = state.toList();
  }
}
