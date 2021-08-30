import 'dart:convert';

class CastResponse{

    bool? adult;
    int? gender;
    int? id;
    String? knownForDepartment;
    String? name;
    String? originalName;
    double? popularity;
    String? profilePath;
    int? castId;
    String? character;
    String? creditId;
    int? order;
    String? department;
    String? job;

      CastResponse({
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order,
        this.department,
        this.job,
    });

    factory CastResponse.fromjson(String jsonBody){
      return CastResponse.fromMap(json.decode(jsonBody));
    }

    factory CastResponse.fromMap(Map<String,dynamic> json){
      return CastResponse(
        
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] == null ? null : json["job"],

      );
    }

    
    String get getprofilePath{

      if(this.profilePath != null){return 'https://image.tmdb.org/t/p/w500${this.profilePath}';}
      return 'https://i.stack.imgur.com/GNhxO.png';

    }




    
}