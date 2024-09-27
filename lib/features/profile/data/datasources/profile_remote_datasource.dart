import 'package:dio/dio.dart';
import 'package:my_practice_bloc/features/profile/data/models/profile_model.dart';
import 'package:my_practice_bloc/features/profile/domain/usecases/profile_params.dart';

abstract class ProfileRemoteDatasource {
  Future<ProfileModel> getUser(GetUserParams params);
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  // final Dio dio;

  // ProfileRemoteDatasourceImpl(this.dio);
  @override
  Future<ProfileModel> getUser(GetUserParams params) async {
    final dio= Dio();
    try {
      final response= await dio.get('https://reqres.in/api/users/${params.id}');
      if (response.statusCode == 200) {
        final data = response.data['data'];
        return ProfileModel.fromJson(data);
      } else {
        throw Exception('Failed to load user');
      }
    } catch(e) {
      throw Exception('Failed to load user: $e');
    }
  }
  
}