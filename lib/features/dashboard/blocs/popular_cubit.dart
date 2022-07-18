import '../../../index.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.movieService) : super(const PopularState.initial());

  final TMDBService movieService;

  Future<void> init() async {
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    emit(state.copyWith(status: ResponseCubitState.loading));
    try {
      GetMoviePopular? response =
          await movieService.getPopularMovies(page: state.currentPage + 1);
      emit(state.copyWith(
        status: ResponseCubitState.success,
        currentPage: state.currentPage + 1,
        movies: [...state.movies, ...?response?.results],
        totalPages: response?.totalPages,
        totalResults: response?.totalResults,
        message: 'Success get popular movies',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ResponseCubitState.failure,
        message: 'Fail get Popular Movies.',
      ));
    }
  }
}
