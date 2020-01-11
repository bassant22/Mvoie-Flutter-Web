class Cast {
  int id;
  String character;
  String creditId;
  int gender;
  String name;
  String _profilePath;

  String get profilePath => "https://image.tmdb.org/t/p/w600_and_h900_bestv2/"+_profilePath;


  Cast({
    this.character = "",
    this.name = "",
    this.creditId="",
    this.gender=0,
    this.id=0
      });

  Cast.fromJson(Map<String,dynamic> map) :
     this.id= map['id'] ?? 0,
     this.name=map['name'] ?? "",
     this.gender=map['gender'] ?? 0,
     this._profilePath=map['profile_path'] ?? "";

}


