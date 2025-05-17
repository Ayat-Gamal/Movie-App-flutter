import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import '../../../service_locator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()); // initial to display screen

  void appStarted() async {
    await Future.delayed(Duration(seconds: 2));

    var isSignedIn = await sl<AuthRepository>().isLoggedIn();
    if (isSignedIn) {
      emit(Authenticated());
      print("auth cubit");
    } else {
      print("Un auth cubit");
      emit(UnAuthenticated());
    }
  }
}
