import 'package:movie_app/data/models/movie/movie_model.dart';
import 'package:movie_app/domain/moive/entities/movie/movie_entity.dart';

import '../../../data/models/tv/tv.dart';
import '../../../domain/tv/entities/tv.dart';

class TVMapper{


  static TVEntity toEntity(TVModel tv){

    return TVEntity(
        adult: tv.adult,
        backdropPath: tv.backdropPath,
        genreIds: tv.genreIds,
        id: tv.id,
        originCountry: tv.originCountry,
        originalLanguage: tv.originalLanguage,
        originalName: tv.originalName,
        overview: tv.overview,
        popularity: tv.popularity,
        posterPath: tv.posterPath,
        firstAirDate: tv.firstAirDate,
        name: tv.name,
        voteAverage: tv.voteAverage,
        voteCount: tv.voteCount) ;

  }
}