

class ProductionCountriesItem {
  String iso;
  String name;

  ProductionCountriesItem({
    this.iso = "",
    this.name = "",
  });

  ProductionCountriesItem.fromJson(Map<String, dynamic>  map) :
        iso = map['iso_3166_1']  ?? "",
        name = map['name']  ?? "";

  Map<String, dynamic> toJson() => {
        'iso_3166_1': iso,
        'name': name,
      };

  ProductionCountriesItem copyWith({
    String iso,
    String name,
  }) {
    return ProductionCountriesItem(
      iso: iso ?? this.iso,
      name: name ?? this.name,
    );
  }

}

