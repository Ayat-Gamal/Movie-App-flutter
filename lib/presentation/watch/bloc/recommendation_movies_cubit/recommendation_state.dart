part of 'recommendation_cubit.dart';

@immutable
sealed class RecommendationState {}

final class RecommendationLoading extends RecommendationState {}

final class RecommendationLoaded extends RecommendationState {
  final List<MovieEntity> movies;

  RecommendationLoaded({required this.movies});
}

final class FailureLoadRecommendation extends RecommendationState {
  final String message;

  FailureLoadRecommendation({required this.message});
}
