import 'package:dio/dio.dart';

abstract class HomepageRemoteDatasource {
  Future<String> getProfile();
  Future<String> getResource();
}

class HomepageRemoteDatasourceImpl implements HomepageRemoteDatasource {
  @override
  Future<String> getProfile() async {
    final dio= Dio();
    try {
      final response= await dio.get('https://reqres.in/api/users/2');
      final firstName= response.data['data']['first_name'];
      return firstName;
    } catch(e) {
      throw Exception('Failed to load profile: $e');
    }
  }

  @override
  Future<String> getResource() async {
    final dio= Dio();
    try {
      final response= await dio.get('https://reqres.in/api/unknown/2');
      final paintName= response.data['data']['name'];
      return paintName;
    } catch(e) {
      throw Exception('Failed to load resource: $e');
    }
  }
}