import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/moive/entities/movie/trailer_entity.dart';
import 'package:movie_app/domain/moive/usecases/get_movie_trailer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../service_locator.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(FailureLoadTrailer(message: error));
      },

      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController _controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: YoutubePlayerFlags(autoPlay: false, mute: true),
        );
        emit(TrailerLoaded(youtubePlayerController: _controller));
      },
    );
  }
}
