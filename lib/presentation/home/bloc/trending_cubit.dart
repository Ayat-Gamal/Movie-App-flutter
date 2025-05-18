import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/moive/entities/movie/movie_entity.dart';
import 'package:movie_app/domain/moive/usecases/get_trending_movie.dart';

import '../../../service_locator.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnData = await sl<GetTrendingMovieUseCase>().call();

    returnData.fold(
      (error) {
        emit(FailureLoadTrendingMovies(errorMessage: error));
      },
      (data) {
        emit(TrendingMoviesLoaded(movies: data));
      },
    );
  }
}
