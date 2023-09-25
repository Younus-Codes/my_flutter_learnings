import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_learnings/api_repository/movies_api.dart';

class MoviesController extends GetxController {
  //various variables
  final RxBool _isLoading = true.obs;
  final RxList _movies = [].obs;
  late final MoviesClient _moviesClient;
  RxBool checkLoading() => _isLoading;
  List get movies => _movies;
  @override
  void onInit() {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    _moviesClient = MoviesClient(dio);
    if (_isLoading.isTrue) {
      getTrendingMovies();
    }
    super.onInit();
  }

  getTrendingMovies() async {
    final res = await _moviesClient.getTrendingMovies(language: "en-US");
    _movies.value = res.results;
    print(_movies.value);
  }
}
