import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_practice_bloc/core/services/shared_preferences.dart';
import 'package:my_practice_bloc/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:my_practice_bloc/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:my_practice_bloc/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:my_practice_bloc/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_practice_bloc/features/auth/domain/usecases/user_login.dart';
import 'package:my_practice_bloc/features/auth/domain/usecases/user_set_url.dart';
import 'package:my_practice_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_practice_bloc/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:my_practice_bloc/features/profile/data/repositories/profile_repostitory_impl.dart';
import 'package:my_practice_bloc/features/profile/domain/repositories/profile_repository.dart';
import 'package:my_practice_bloc/features/profile/domain/usecases/get_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

var myInjection= GetIt.instance;

Future<void> init() async {
  myInjection.registerLazySingleton(
    () => Dio()
  );

  final sharedPreferences= await SharedPreferences.getInstance();
  myInjection.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences
  );

  myInjection.registerLazySingleton(
    () => SharedPreferencesHelper()
  );

  myInjection.registerFactory(
    () => AuthBloc(
      myInjection(),
      myInjection(),
      myInjection(),
    )
  );

  myInjection.registerLazySingleton(
    () => UserLogin(
      authRepository: myInjection()
    )
  );

  myInjection.registerLazySingleton(
    () => UserSetUrl(authRepository: myInjection()
    )
  );

  myInjection.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      myInjection(),
      myInjection(),
    )
  );

  myInjection.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(
      dio: myInjection()
    )
  );

  myInjection.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(
      myInjection(),
    )
  );

  // get user
  myInjection.registerLazySingleton(
    () => GetUser(
      myInjection()
    )
  );

  myInjection.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      myInjection(),
    )
  );

  myInjection.registerLazySingleton<ProfileRemoteDatasource>(
    () => ProfileRemoteDatasourceImpl(
      // myInjection(),
    )
  );
}