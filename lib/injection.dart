import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/services/shared_preferences.dart';
import 'features/auth/data/datasources/auth_local_datasource.dart';
import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/user_login.dart';
import 'features/auth/domain/usecases/user_set_url.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/dashboard/data/datasources/profile_remote_datasource.dart';
import 'features/dashboard/data/repositories/profile_repostitory_impl.dart';
import 'features/dashboard/domain/repositories/dashboard_repository.dart';
import 'features/dashboard/domain/usecases/get_paint.dart';
import 'features/dashboard/domain/usecases/get_user.dart';
import 'features/dashboard/presentation/bloc/dashboard_bloc.dart';
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
  myInjection.registerFactory(
    () => DashboardBloc(
      myInjection(),
      myInjection(),
    )
  );
  
  myInjection.registerLazySingleton(
    () => GetUser(
      myInjection()
    )
  );

  myInjection.registerLazySingleton(
    () => GetPaint(
      myInjection()
    )
  );

  myInjection.registerLazySingleton<DashboardRepository>(
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