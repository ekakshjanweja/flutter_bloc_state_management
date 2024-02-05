import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);

    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  // @override
  // void onChange(Change<AuthenticationState> change) {
  //   // TODO: implement onChange
  //   super.onChange(change);
  //   print("AuthenticationBloc [CHANGE]: $change");
  // }

  // @override
  // void onTransition(
  //     Transition<AuthenticationEvent, AuthenticationState> transition) {
  //   // TODO: implement onTransition
  //   super.onTransition(transition);
  //   print("AuthenticationBloc [TRANSITION]: $transition");
  // }

  void _onAuthLoginRequested(
      AuthLoginRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final email = event.email;
      final password = event.password;

      if (password.length < 6) {
        return emit(
          AuthenticationFaliure(errorMessage: "Password is too short"),
        );
      }

      await Future.delayed(const Duration(seconds: 1), () {
        return emit(
          AuthenticationSuccess(uid: "$email-$password"),
        );
      });
    } catch (e) {
      return emit(
        AuthenticationFaliure(errorMessage: e.toString()),
      );
    }
  }

  void _onAuthLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthenticationInitial());
      });
    } catch (e) {
      emit(
        AuthenticationFaliure(errorMessage: e.toString()),
      );
    }
  }
}
