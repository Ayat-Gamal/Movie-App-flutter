import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/keyword_mapper.dart';
import 'package:movie_app/core/models/keywrod_model.dart';
import 'package:movie_app/data/datasources/tv/tv_service.dart';

import '../../../common/helper/mapper/tv_mapper.dart';
import '../../../domain/tv/repositories/tv.dart';
import '../../../service_locator.dart';
import '../../models/tv/tv.dart';

class TVRepositoryImpl implements TVRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnData = await sl<TVService>().getPopularTV();
    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(
              data['results'],
            ).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    var returnData = await sl<TVService>().getRecommendationTVs(tvId);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(
              data['results'],
            ).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    var returnData = await sl<TVService>().getSimilarTVs(tvId);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(
              data['results'],
            ).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    var returnData = await sl<TVService>().getKeywords(tvId);

    return returnData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['results'])
                .map(
                  (item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)),
                )
                .toList();

        return Right(movies);
      },
    );
  }
}
