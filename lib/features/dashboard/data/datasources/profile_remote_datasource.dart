import 'package:dio/dio.dart';
import 'package:my_practice_bloc/core/error/exception.dart';
import '../models/paint_model.dart';
import '../models/profile_model.dart';
import '../../domain/usecases/dashboard_params.dart';

abstract class ProfileRemoteDatasource {
  Future<ProfileModel> getUser(DashboardParams params);
  Future<PaintModel> getPaint(DashboardParams params);
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  @override
  Future<ProfileModel> getUser(DashboardParams params) async {
    final dio= Dio();
    try {
      final response= await dio.get('https://reqres.in/api/users/${params.id}');
      if (response.statusCode == 200) {
        final data = response.data['data'];
        return ProfileModel.fromJson(data);
      } else {
        throw ServerException(message: 'Failed to load user: ${response.statusCode}');
      }
    } catch(e) {
      throw GeneralException(message: 'Failed to load user: $e');
    }
  }
  
  @override
  Future<PaintModel> getPaint(DashboardParams params) async {
    try {
      final dio= Dio();
      final response = await dio.get('https://reqres.in/api/unknown/${params.id}');
      final dataRes= response.data['data'];
      return PaintModel.fromJson(dataRes);
    } catch(e) {
      throw GeneralException(message: 'Failed to load paint: $e');
    }
  }
  
}