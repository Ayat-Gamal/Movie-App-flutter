import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/moive/repositories/movie_repo.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class GetTrendingMovieUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}
