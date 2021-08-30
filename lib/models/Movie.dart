
import 'dart:convert';

class Movie {

    bool? adult;
    bool? video;
    double? popularity;
    double? voteAverage;
    int? id;
    int? voteCount;
    List<int>? genreIds;
    String? backdropPath;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    String? posterPath;
    String? releaseDate;
    String? title;
    
    Movie({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    String get getPosterImg{

      if(this.posterPath != null){return 'https://image.tmdb.org/t/p/w500${this.posterPath}';}
      return 'https://i.stack.imgur.com/GNhxO.png';
    }

    String get getBackDropPath{

      if(this.posterPath != null){return 'https://image.tmdb.org/t/p/w500${this.backdropPath}';}
      return 'https://i.stack.imgur.com/GNhxO.png';

    }


    factory Movie.fromJson(String str){
      return Movie.fromMap(json.decode(str));
    }

    factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult             : json["adult"],
        backdropPath      : json["backdrop_path"],
        genreIds          : List<int>.from(json["genre_ids"].map((x) => x)),
        id                : json["id"],
        originalLanguage  : json["original_language"],
        originalTitle     : json["original_title"],
        overview          : json["overview"],
        popularity        : json["popularity"].toDouble(),
        posterPath        : json["poster_path"],
        releaseDate       : json["release_date"],
        title             : json["title"],
        video             : json["video"],
        voteAverage       : json["vote_average"].toDouble(),
        voteCount         : json["vote_count"],
    );

}


