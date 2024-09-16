import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_practice_bloc/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:my_practice_bloc/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:my_practice_bloc/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_practice_bloc/features/auth/domain/usecases/user_login.dart';
import 'package:my_practice_bloc/features/auth/presentation/bloc/auth_bloc.dart';

var myInjection= GetIt.instance;

Future<void> init() async {
  myInjection.registerLazySingleton(
    () => Dio()
  );

  myInjection.registerFactory(
    () => AuthBloc(
      myInjection()
    )
  );

  myInjection.registerLazySingleton(
    () => UserLogin(
      authRepository: myInjection()
    )
  );

  myInjection.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDatasource: myInjection()
    )
  );

  myInjection.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(
      dio: myInjection()
    )
  );
}