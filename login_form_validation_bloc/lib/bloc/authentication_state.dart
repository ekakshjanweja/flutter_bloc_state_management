part of 'authentication_bloc.dart';

sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {
  final String uid;

  AuthenticationSuccess({
    required this.uid,
  });
}

final class AuthenticationFaliure extends AuthenticationState {
  final String errorMessage;

  AuthenticationFaliure({
    required this.errorMessage,
  });
}
