import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/moive/usecases/get_similar_movies.dart';

import '../../../../domain/moive/entities/movie/movie_entity.dart';
import '../../../../service_locator.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesLoading());

  void getSimilarMoviesMovies(int movieId) async {
    var returnData = await sl<GetSimilarMovieUseCase>().call(params: movieId);

    returnData.fold(
      (error) {
        emit(FailureLoadSimilarMovies(message: error));
      },
      (data) {
        emit(SimilarMoviesLoaded(movies: data));
      },
    );
  }
}
