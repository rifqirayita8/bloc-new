import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/features/auth/domain/usecases/user_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin userLogin;
  AuthBloc(this.userLogin) : super(AuthInitial()) {
    on<AuthEvent>((_, emit) {
      emit(AuthLoading());
    });
    on<AuthLogin>((event, emit) async {
      final res= await userLogin.execute(event.email, event.password);

      res.fold(
        (failure) => emit(AuthFailure(message: failure.message)), 
        (message) => emit(AuthSuccess(message: message))
      );
    });
  }
}
