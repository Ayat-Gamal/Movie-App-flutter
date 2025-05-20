import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/tv/usecase/get_popular_tv.dart';
import '../../../domain/tv/entities/tv.dart';
import '../../../service_locator.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvLoading());

  void getPopularTv() async {
    var returnData = await sl<GetPopularTVUseCase>().call();

    returnData.fold(
      (error) {
        emit(FailureLoadPopularTv(errorMessage: error));
      },
      (data) {
        emit(PopularTvLoaded(tvList: data));
      },
    );
  }
}
