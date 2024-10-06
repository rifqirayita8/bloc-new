import 'package:flutter/widgets.dart';
import 'package:my_practice_bloc/features/dashboard/data/datasources/profile_remote_datasource.dart';
import 'package:my_practice_bloc/features/dashboard/domain/usecases/dashboard_params.dart';
import 'package:my_practice_bloc/features/homepage/data/datasources/homepage_remote_datasource.dart';
import 'package:my_practice_bloc/injection.dart';

void main() async {
  final HomepageRemoteDatasourceImpl profileRemoteDatasourceImpl= HomepageRemoteDatasourceImpl(

  );
  try {
    var response= await profileRemoteDatasourceImpl.getResourceList();
    print(response);
  } catch(e) {
    print(e);
  }
}