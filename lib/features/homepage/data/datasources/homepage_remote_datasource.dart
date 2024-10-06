import 'package:dio/dio.dart';
import 'package:my_practice_bloc/features/homepage/data/models/homepage_model.dart';

abstract class HomepageRemoteDatasource {
  Future<String> getProfile();
  Future<String> getResource();
  Future<List<HomepageDataModel>> getProfileList();
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
  
  @override
  Future<List<HomepageDataModel>> getProfileList() async {
    final dio= Dio();
    try {
      final response= await dio.get('https://reqres.in/api/users?page=2');
      final profileList= response.data['data'] as List<dynamic>;
      return HomepageDataModel.fromJsonList(profileList);
    } catch(e) {
      throw Exception('Failed to load profile list: $e');
    }
  }
}