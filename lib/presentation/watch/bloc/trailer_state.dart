part of 'trailer_cubit.dart';

@immutable
sealed class TrailerState {}

final class TrailerLoading extends TrailerState {}

final class TrailerLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;

  TrailerLoaded({required this.youtubePlayerController});
}

final class FailureLoadTrailer extends TrailerState {
  final String message;

  FailureLoadTrailer({required this.message});
}
