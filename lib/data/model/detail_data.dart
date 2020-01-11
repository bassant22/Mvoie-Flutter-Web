import 'package:redux_testing/data/model/genresitem_data.dart';
import 'package:redux_testing/data/model/productioncompaniesitem_data.dart';
import 'package:redux_testing/data/model/productioncountriesitem_data.dart';
import 'package:redux_testing/data/model/spokenlanguagesitem_data.dart';

class Detail {
  String originalLanguage;
  String imdbId;
  bool video;
  String title;
  String backdropPath;
  num revenue;
  List<GenresItem> genres;
  num popularity;
  List<ProductionCountriesItem> productionCountries;
  int id;
  num voteCount;
  num budget;
  String overview;
  String originalTitle;
  int runtime;
  String _posterPath;
  List<SpokenLanguagesItem> spokenLanguages;
  List<ProductionCompaniesItem> productionCompanies;
  String releaseDate;
  num voteAverage;
  Null belongsToCollection;
  String tagline;
  bool adult;
  String homepage;
  String status;

  String get posterPath => "https://image.tmdb.org/t/p/w600_and_h900_bestv2/" +_posterPath;

  Detail({
    this.originalLanguage = "",
    this.imdbId = "",
    this.video = false,
    this.title = "",
    this.backdropPath = "",
    this.revenue = 0,
    this.genres,
    this.popularity = 0.0,
    this.productionCountries,
    this.id = 0,
    this.voteCount = 0,
    this.budget = 0,
    this.overview = "",
    this.originalTitle = "",
    this.runtime = 0,
    this.spokenLanguages,
    this.productionCompanies,
    this.releaseDate = "",
    this.voteAverage = 0,
    this.belongsToCollection,
    this.tagline = "",
    this.adult = false,
    this.homepage = "",
    this.status = "",
  });

  Detail.fromJson(Map<String, dynamic>  map) :
        originalLanguage = map['original_language']  ?? "",
        imdbId = map['imdb_id']  ?? "",
        video = map['video']  ?? false,
        title = map['title']  ?? "",
        backdropPath = map['backdrop_path']  ?? "",
        revenue = map['revenue']  ?? 0,
        popularity = map['popularity']  ?? 0.0,
        id = map['id']  ?? 0,
        voteCount = map['vote_count']  ?? 0,
        budget = map['budget']  ?? 0,
        overview = map['overview']  ?? "",
        originalTitle = map['original_title']  ?? "",
        runtime = map['runtime']  ?? 0,
        _posterPath = map['poster_path']  ?? "",
        releaseDate = map['release_date']  ?? "",
        voteAverage = map['vote_average']  ?? 0,
        tagline = map['tagline']  ?? "",
        adult = map['adult']  ?? false,
        homepage = map['homepage']  ?? "",
        status = map['status']  ?? "";

  Map<String, dynamic> toJson() => {
        'original_language': originalLanguage,
        'imdb_id': imdbId,
        'video': video,
        'title': title,
        'backdrop_path': backdropPath,
        'revenue': revenue,
        'genres': genres,
        'popularity': popularity,
        'production_countries': productionCountries,
        'id': id,
        'vote_count': voteCount,
        'budget': budget,
        'overview': overview,
        'original_title': originalTitle,
        'runtime': runtime,
        'poster_path': _posterPath,
        'spoken_languages': spokenLanguages,
        'production_companies': productionCompanies,
        'release_date': releaseDate,
        'vote_average': voteAverage,
        'belongs_to_collection': belongsToCollection,
        'tagline': tagline,
        'adult': adult,
        'homepage': homepage,
        'status': status,
      };

  Detail copyWith({
    String originalLanguage,
    String imdbId,
    bool video,
    String title,
    String backdropPath,
    int revenue,
    List<GenresItem> genres,
    double popularity,
    List<ProductionCountriesItem> productionCountries,
    int id,
    int voteCount,
    int budget,
    String overview,
    String originalTitle,
    int runtime,
    String posterPath,
    List<SpokenLanguagesItem> spokenLanguages,
    List<ProductionCompaniesItem> productionCompanies,
    String releaseDate,
    int voteAverage,
    Null belongsToCollection,
    String tagline,
    bool adult,
    String homepage,
    String status,
  }) {
    return Detail(
      originalLanguage: originalLanguage ?? this.originalLanguage,
      imdbId: imdbId ?? this.imdbId,
      video: video ?? this.video,
      title: title ?? this.title,
      backdropPath: backdropPath ?? this.backdropPath,
      revenue: revenue ?? this.revenue,
      genres: genres ?? this.genres,
      popularity: popularity ?? this.popularity,
      productionCountries: productionCountries ?? this.productionCountries,
      id: id ?? this.id,
      voteCount: voteCount ?? this.voteCount,
      budget: budget ?? this.budget,
      overview: overview ?? this.overview,
      originalTitle: originalTitle ?? this.originalTitle,
      runtime: runtime ?? this.runtime,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
      belongsToCollection: belongsToCollection ?? this.belongsToCollection,
      tagline: tagline ?? this.tagline,
      adult: adult ?? this.adult,
      homepage: homepage ?? this.homepage,
      status: status ?? this.status,
    );
  }

}

