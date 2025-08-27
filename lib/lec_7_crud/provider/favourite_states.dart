import 'package:riverpod_demo/lec_7_crud/model/item.dart';

class FavouriteStates {
  final List<Item> allItems;
  final List<Item> filterItems;
  final String searchQuery;
  FavouriteStates({required this.allItems, required this.filterItems, required this.searchQuery});

  FavouriteStates copyWith({List<Item>? allItems, List<Item>? filterItems, String? searchQuery}) {
    return FavouriteStates(
      allItems: allItems ?? this.allItems,
      filterItems: filterItems ?? this.filterItems,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
