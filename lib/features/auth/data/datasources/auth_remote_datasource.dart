import 'package:dio/dio.dart';
import 'package:my_practice_bloc/core/error/exception.dart';
import 'package:my_practice_bloc/core/services/my_interceptor.dart';
import 'package:my_practice_bloc/core/services/shared_preferences.dart';
import 'package:my_practice_bloc/injection.dart';

abstract class AuthRemoteDatasource {
  Future<String> authLogin(String email, String password);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl({required this.dio}){
    dio.interceptors.add(MyInterceptor());
  }
  /*
  https://sanctum-new-production.up.railway.app/api
  {
    "name": "rifqi-tes",
    "email": "rifqites@gmail.com",
    "password": "Rifqites1"
  }
  */

  @override
  Future<String> authLogin(String email, String password) async {
    final prefs= await SharedPreferencesHelper().getUrl();
    final prefss= await myInjection<SharedPreferencesHelper>().getUrl();
    print('Base URL= $prefs');
    print('instance myinjection= $prefss');
    try {
      final response= await dio.post(
        '/login',
        data: {
          "email": email,
          "password": password,
        }
      );
      print(response.data);
      return response.data['token'];
    } on DioException catch(e) {
      if (e.response?.statusCode == 401) {
        throw ServerException(message: e.response?.data['message']);  
      } else if (e.response?.statusCode == 422) {
        final err= e.response?.data['errors']['email'];
        if (err != null && err is List) {
          throw ServerException(message: err.join(', '));
        }
      } else if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        throw const GeneralException(message: 'Koneksi timeout');
      } else if (e.type == DioExceptionType.badResponse || e.type == DioExceptionType.cancel) {
        throw const GeneralException(message: 'Bad Response, silahkan coba lagi');
      }
      throw const GeneralException(message: 'Ada masalah dengan server');     
    }
  } 
}