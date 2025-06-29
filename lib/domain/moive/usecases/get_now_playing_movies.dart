import 'package:dartz/dartz.dart';
import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../repositories/movie_repo.dart';

class GetNowPlayingMovieUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getNowPlayingMovies();
  }
}
