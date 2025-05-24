import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/moive/usecases/get_recommendation_movies.dart';

import '../../../../domain/moive/entities/movie/movie_entity.dart';
import '../../../../service_locator.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  RecommendationCubit() : super(RecommendationLoading());

  void getRecommendationMovies(int movieId) async {
    var returnData = await sl<GetRecommendationMovieUseCase>().call(params: movieId);

    returnData.fold(
      (error) {
        emit(FailureLoadRecommendation(message: error));
      },
      (data) {
        emit(RecommendationLoaded(movies: data));
      },
    );
  }
}
