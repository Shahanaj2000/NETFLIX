import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search_resp.g.dart';

@JsonSerializable()
class SearchResp {
  int? page;
  List<Result>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  SearchResp({this.page, this.results, this.totalPages, this.totalResults});

  factory SearchResp.fromJson(Map<String, dynamic> json) {
    return _$SearchRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}
