import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/shared_preferences.dart';
import '../../domain/usecases/user_login.dart';
import '../../domain/usecases/user_set_url.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin userLogin;
  final UserSetUrl userSetUrl;
  final SharedPreferencesHelper sharedPreferencesHelper;

  AuthBloc(
    this.userLogin, 
    this.userSetUrl, 
    this.sharedPreferencesHelper
  ) : super(AuthInitial()) {

    on<AuthEvent>((_, emit) {
      emit(AuthLoading());
    });

    on<AuthSetUrl>((event, emit) async {
      final uri= Uri.tryParse(event.url);
      if (uri == null || uri.scheme.isEmpty || uri.authority.isEmpty) {
        print('url invalid');
        emit(const SetUrlFailure(message: 'Invalid URL'));
        return;
      }
      await userSetUrl.execute(event.url);
      emit(const SetUrlSuccess(message: 'URL set successfully'));
      print('URL set to: ${event.url}');
    });

    on<AuthLogin>((event, emit) async {
      final res= await userLogin.execute(event.email, event.password);

      res.fold(
        (failure) => emit(AuthFailure(message: failure.message)), 
        (message) => emit(AuthSuccess(message: message))
      );
    });

    on<AuthLogout>((event, emit) async {
      await sharedPreferencesHelper.removeUrl();
      emit(AuthInitial());
    });
  }
}
