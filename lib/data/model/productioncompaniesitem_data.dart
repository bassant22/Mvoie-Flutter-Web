

class ProductionCompaniesItem {
  Null logoPath;
  String name;
  int id;
  String originCountry;

  ProductionCompaniesItem({
    this.logoPath,
    this.name = "",
    this.id = 0,
    this.originCountry = "",
  });

  ProductionCompaniesItem.fromJson(Map<String, dynamic>  map) :
        name = map['name']  ?? "",
        id = map['id']  ?? 0,
        originCountry = map['origin_country']  ?? "";

  Map<String, dynamic> toJson() => {
        'logo_path': logoPath,
        'name': name,
        'id': id,
        'origin_country': originCountry,
      };

  ProductionCompaniesItem copyWith({
    Null logoPath,
    String name,
    int id,
    String originCountry,
  }) {
    return ProductionCompaniesItem(
      logoPath: logoPath ?? this.logoPath,
      name: name ?? this.name,
      id: id ?? this.id,
      originCountry: originCountry ?? this.originCountry,
    );
  }

}

