part of 'popular_tv_cubit.dart';

@immutable
sealed class PopularTvState {}

final class PopularTvLoading extends PopularTvState {}

final class PopularTvLoaded extends PopularTvState {
  final List<TVEntity> tvList;

  PopularTvLoaded({required this.tvList});
}

final class FailureLoadPopularTv extends PopularTvState {
  final String errorMessage;

  FailureLoadPopularTv({required this.errorMessage});
}
