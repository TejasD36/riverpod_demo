class Item {
  final String id;
  final String name;
  final bool isFav;
  Item({required this.id, required this.name, required this.isFav});

  Item copyWith({String? id, String? name, bool? isFav}) {
    return Item(id: id ?? this.id, name: name ?? this.name, isFav: isFav ?? this.isFav);
  }
}
