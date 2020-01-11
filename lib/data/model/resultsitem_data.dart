class ResultsItem {
  String site;
  int size;
  String iso;
  String name;
  String id;
  String type;
  String key;

  ResultsItem({
    this.site = "",
    this.size = 0,
    this.iso = "",
    this.name = "",
    this.id = "",
    this.type = "",
    this.key = "",
  });

  ResultsItem.fromJson(Map<String, dynamic>  map) :
        site = map['site']  ?? "",
        size = map['size']  ?? 0,
        iso = map['iso_3166_1']  ?? "",
        name = map['name']  ?? "",
        id = map['id']  ?? "",
        type = map['type']  ?? "",
        key = map['key']  ?? "";

  Map<String, dynamic> toJson() => {
        'site': site,
        'size': size,
        'iso_3166_1': iso,
        'name': name,
        'id': id,
        'type': type,
        'iso_639_1': iso,
        'key': key,
      };

  ResultsItem copyWith({
    String site,
    int size,
    String iso,
    String name,
    String id,
    String type,
    String key,
  }) {
    return ResultsItem(
      site: site ?? this.site,
      size: size ?? this.size,
      iso: iso ?? this.iso,
      name: name ?? this.name,
      id: id ?? this.id,
      type: type ?? this.type,
      key: key ?? this.key,
    );
  }

}

