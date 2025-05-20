import 'package:dartz/dartz.dart';
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
}
