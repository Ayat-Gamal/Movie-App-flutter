part of 'data_cubit.dart';

@immutable
sealed class DataState {}

final class DataLoading extends DataState {}

final class DataLoaded<T> extends DataState {
  final List<T> dataList;

  DataLoaded({required this.dataList} );
}

final class FailureLoadData extends DataState {
  final String errorMessage;

  FailureLoadData({required this.errorMessage});
}
