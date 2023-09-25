import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_api.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3")
abstract class MoviesClient {
  factory MoviesClient(Dio dio, {String baseUrl}) = _MoviesClient;

  @GET("/trending/movie/day")
  Future<MoviesResponse> getTrendingMovies({
    @Query("language") required language,
  });
}

@JsonSerializable()
class MoviesResponse {
  List<ResultBean> results;

  MoviesResponse({
    required this.results,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

@JsonSerializable()
class ResultBean {
  @JsonKey(name: "original_title")
  String originalTitle;
  @JsonKey(name: "overview")
  String overview;
  @JsonKey(name: "popularity")
  double popularity;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: "title")
  String title;

  ResultBean({
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
  });

  factory ResultBean.fromJson(Map<String, dynamic> json) =>
      _$ResultBeanFromJson(json);
  Map<String, dynamic> toJson() => _$ResultBeanToJson(this);
}
