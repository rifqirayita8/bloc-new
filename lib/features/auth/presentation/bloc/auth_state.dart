part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();  

  @override
  List<Object> get props => [];
}
class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  const AuthSuccess({required this.message});
}

class SetUrlSuccess extends AuthState {
  final String message;

  const SetUrlSuccess({required this.message});
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({required this.message});
}

class SetUrlFailure extends AuthState {
  final String message;

  const SetUrlFailure({required this.message});
}
