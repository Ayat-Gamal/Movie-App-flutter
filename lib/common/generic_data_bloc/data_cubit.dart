import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/moive/entities/movie/trailer_entity.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataLoading());

  void getData<T>(UseCase usecase,{dynamic params}) async {
    var returnData = await usecase.call(params: params);

    returnData.fold(
      (error) {
        emit(FailureLoadData(errorMessage: error));
      },
      (data) {
         emit(
            DataLoaded(dataList: data)
        );
      },
    );
  }
}
