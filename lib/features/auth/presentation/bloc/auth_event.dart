part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  const AuthLogin({required this.email, required this.password});
}

final class AuthSetUrl extends AuthEvent {
  final String url;

  const AuthSetUrl({required this.url});
}

final class AuthLogout extends AuthEvent {
  const AuthLogout();
}