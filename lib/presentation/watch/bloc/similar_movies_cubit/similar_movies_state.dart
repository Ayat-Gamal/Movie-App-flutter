part of 'similar_movies_cubit.dart';

@immutable
sealed class SimilarMoviesState {}

final class SimilarMoviesLoading extends SimilarMoviesState {}

final class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<MovieEntity> movies;

  SimilarMoviesLoaded({required this.movies});
}

final class FailureLoadSimilarMovies extends SimilarMoviesState {
  final String message;

  FailureLoadSimilarMovies({required this.message});
}
