import 'package:flutter/widgets.dart';
import 'package:my_practice_bloc/features/dashboard/data/datasources/profile_remote_datasource.dart';
import 'package:my_practice_bloc/features/dashboard/domain/usecases/profile_params.dart';
import 'package:my_practice_bloc/injection.dart';

void main() async {
  final ProfileRemoteDatasourceImpl profileRemoteDatasourceImpl= ProfileRemoteDatasourceImpl(

  );
  try {
    var response= await profileRemoteDatasourceImpl.getUser(GetUserParams(id: 1));
    print(response.toJson());
  } catch(e) {
    print(e);
  }
}