import 'package:dartz/dartz.dart';
import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../tv/repositories/tv.dart';

class GetTVKeywordsUseCase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TVRepository>().getKeywords(params!);
  }
}
