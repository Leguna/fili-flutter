part of 'popular_cubit.dart';

enum ResponseCubitState { initial, loading, success, failure }

class PopularState extends Equatable {
  final ResponseCubitState status;
  final String message;
  final int currentPage;
  final int totalPages;
  final int totalResults;
  final List<Movie> movies;

  const PopularState({
    required this.status,
    required this.message,
    required this.currentPage,
    required this.totalPages,
    required this.totalResults,
    required this.movies,
  });

  const PopularState.initial({
    this.currentPage = 0,
    this.totalPages = 0,
    this.totalResults = 0,
    this.movies = const [],
    this.status = ResponseCubitState.initial,
    this.message = '',
  });

  @override
  List<Object> get props => [
        currentPage,
        totalPages,
        totalResults,
        movies,
        status,
        message,
      ];

  PopularState copyWith({
    ResponseCubitState? status,
    String? message,
    int? currentPage,
    int? totalPages,
    int? totalResults,
    List<Movie>? movies,
  }) {
    return PopularState(
      status: status ?? this.status,
      message: message ?? this.message,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      movies: movies ?? this.movies,
    );
  }
}
