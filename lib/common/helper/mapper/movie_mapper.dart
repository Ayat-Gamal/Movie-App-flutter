import 'package:movie_app/data/models/movie/movie_model.dart';
import 'package:movie_app/domain/moive/entities/movie/movie_entity.dart';

class MovieMapper{


  static MovieEntity toEntity(MovieModel movie){

    return MovieEntity(
        adult: movie.adult,
        backdropPath: movie.backdropPath,
        genreIds: movie.genreIds,
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: movie.posterPath,
        releaseDate: movie.releaseDate,
        title: movie.title,
        video: movie.video,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount);
  }
}