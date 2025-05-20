import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/moive/usecases/get_now_playing_movies.dart';

import '../../../domain/moive/entities/movie/movie_entity.dart';
import '../../../service_locator.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingLoading());

  void getNowPlayingMovies() async {
    var returnData = await sl<GetNowPlayingMovieUseCase>().call();

    returnData.fold(
      (error) {
        emit(FailureLoadNowPlayingMovies(errorMessage: error));
      },
      (data) {
        emit(NowPlayingLoaded(movies: data));
      },
    );
  }
}
