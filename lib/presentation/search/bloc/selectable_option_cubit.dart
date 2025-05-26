import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selectable_option_state.dart';
enum SearchType {movie,tv}
class SelectableOptionCubit extends Cubit<SelectableOptionState> {
  SelectableOptionCubit() : super(SearchType.movie as SelectableOptionState);

  void selectMovie() => emit(SearchType.movie as SelectableOptionState);
  void selectTV() => emit(SearchType.tv as SelectableOptionState);
}
