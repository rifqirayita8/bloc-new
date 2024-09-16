import 'package:dio/dio.dart';
import 'package:my_practice_bloc/core/error/exception.dart';

abstract class AuthRemoteDatasource {
  Future<String> authLogin(String email, String password);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl({required this.dio}){
    dio.options.baseUrl= 'https://sanctum-new-production.up.railway.app/api';
  }

  @override
  Future<String> authLogin(String email, String password) async {
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
    } catch(e) {
      if (e is DioException && e.response?.statusCode == 401) {
        throw ServerException(message: e.response?.data['message']);  
      } else if (e is DioException && e.response?.statusCode == 422) {
        final err= e.response?.data['errors']['email'];
        if (err != null && err is List) {
          throw ServerException(message: err.join(', '));
        }
      }
      throw GeneralException(message: 'General Exception');     
    }
  } 
}