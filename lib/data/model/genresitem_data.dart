

class GenresItem {
  String name;
  int id;

  GenresItem({
    this.name = "",
    this.id = 0,
  });

  GenresItem.fromJson(Map<String, dynamic>  map) :
        name = map['name']  ?? "",
        id = map['id']  ?? 0;

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };

  GenresItem copyWith({
    String name,
    int id,
  }) {
    return GenresItem(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

}

