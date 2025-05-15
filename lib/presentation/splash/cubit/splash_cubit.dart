import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()); // initial to display screen

  void appStarted() async {
    await Future.delayed(Duration(seconds: 2));
    emit(Authenticated());
  }
}
