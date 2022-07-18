import '../../index.dart';

class TMDBService {
  final Dio _dio = TMDBApi.createDio();

  Future<GetMoviePopular?> getPopularMovies({
    int page = 1,
  }) async {
    GetMoviePopular? movies;
    try {
      Response<dynamic> response = await _dio.get(
        '/movie/popular',
        queryParameters: {
          'page': page,
        },
      );
      movies = GetMoviePopular.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        return movies;
      } else {
        rethrow;
      }
    }
    return movies;
  }
}
