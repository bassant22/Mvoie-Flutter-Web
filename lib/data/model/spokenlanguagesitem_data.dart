

class SpokenLanguagesItem {
  String name;
  String iso;

  SpokenLanguagesItem({
    this.name = "",
    this.iso = "",
  });

  SpokenLanguagesItem.fromJson(Map<String, dynamic>  map) :
        name = map['name']  ?? "",
        iso = map['iso_639_1']  ?? "";

  Map<String, dynamic> toJson() => {
        'name': name,
        'iso_639_1': iso,
      };

  SpokenLanguagesItem copyWith({
    String name,
    String iso,
  }) {
    return SpokenLanguagesItem(
      name: name ?? this.name,
      iso: iso ?? this.iso,
    );
  }

}

