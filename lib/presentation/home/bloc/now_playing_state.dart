part of 'now_playing_cubit.dart';

@immutable
sealed class NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingLoaded extends NowPlayingState {
  final List<MovieEntity> movies;

  NowPlayingLoaded({required this.movies});
}

final class FailureLoadNowPlayingMovies extends NowPlayingState {
  final String errorMessage;

  FailureLoadNowPlayingMovies({required this.errorMessage});
}
