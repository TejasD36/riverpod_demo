import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/lec_7_crud/provider/favourite_states.dart';

import '../model/item.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, FavouriteStates>((ref) {
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteStates> {
  FavouriteNotifier() : super(FavouriteStates(allItems: [], filterItems: [], searchQuery: ""));

  void addItem() {
    List<Item> items = [
      Item(id: "1", name: "Item 1", isFav: true),
      Item(id: "2", name: "Item 2", isFav: false),
      Item(id: "3", name: "Item 3", isFav: true),
      Item(id: "4", name: "Item 4", isFav: false),
      Item(id: "5", name: "Item 5", isFav: false),
    ];

    state = state.copyWith(allItems: items.toList(), filterItems: items.toList());
  }

  void filterList(String query) {
    state = state.copyWith(filterItems: _filterItems(state.allItems, query));
  }

  void favList(bool showFav) {
    state = state.copyWith(filterItems: _favItems(state.allItems, showFav));
  }

  List<Item> _filterItems(List<Item> items, String query) {
    if (query.isEmpty) {
      return items;
    } else {
      return items.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
    }
  }

  List<Item> _favItems(List<Item> items, bool showFav) {
    if (showFav) {
      return items.where((element) => element.isFav == true).toList();
    } else {
      return items;
    }
  }
}
