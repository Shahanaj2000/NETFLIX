import 'package:json_annotation/json_annotation.dart';



part 'hot.new_resp.g.dart';

@JsonSerializable()
class HotAndNewResp {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<HotNewData> results;

  HotAndNewResp({this.page, this.results = const []});

  factory HotAndNewResp.fromJson(Map<String, dynamic> json) => _$HotAndNewRespFromJson(json);

  Map<String, dynamic> toJson() => _$HotAndNewRespToJson(this);
}


@JsonSerializable()
class HotNewData {
  
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  //In case of tv series , use orginal_name insted of orginal_title
  String? originalTitle;
   @JsonKey(name: 'original_name')
  String? originalName;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  
  @JsonKey(name: 'release_date')
  String? releaseDate;
  

  HotNewData({
    
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    
    this.releaseDate,
   
  });

  factory HotNewData.fromJson(Map<String, dynamic> json) {
    return _$HotNewDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotNewDataToJson(this);
}
