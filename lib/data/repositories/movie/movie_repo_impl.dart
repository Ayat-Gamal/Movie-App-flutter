import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/common/helper/mapper/trailer_mappper.dart';
import 'package:movie_app/data/datasources/movie/movie_service.dart';
import 'package:movie_app/data/models/movie/trailer_model.dart';
import '../../../domain/moive/repositories/movie_repo.dart';
import '../../../service_locator.dart';
import '../../models/movie/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnData = await sl<MovieService>().getTrendingMovies();
    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['results'])
                .map((item) => MovieMapper.toEntity(KeywordModel.fromJson(item)))
                .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnData = await sl<MovieService>().getNowPLayingMovies();

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['results'])
                .map((item) => MovieMapper.toEntity(KeywordModel.fromJson(item)))
                .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnData = await sl<MovieService>().getMovieTrailer(movieId);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = TrailerMapper.toEntity(
          TrailerModel.fromJson(data['results'][0]),
        );
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async{
    var returnData = await sl<MovieService>().getRecommendationMovies(movieId);

    return returnData.fold(
          (error) {
        return Left(error);
      },
          (data) {
        var movies =
        List.from(data['results'])
            .map((item) => MovieMapper.toEntity(KeywordModel.fromJson(item)))
            .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async{
    var returnData = await sl<MovieService>().getSimilarMovies(movieId);

    return returnData.fold(
          (error) {
        return Left(error);
      },
          (data) {
        var movies =
        List.from(data['results'])
            .map((item) => MovieMapper.toEntity(KeywordModel.fromJson(item)))
            .toList();

        return Right(movies);
      },
    );
  }
}
