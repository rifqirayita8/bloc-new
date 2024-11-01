import 'package:dio/dio.dart';
import 'package:my_practice_bloc/core/error/exception.dart';
import 'package:my_practice_bloc/features/homepage/data/models/homepage_model.dart';
import 'package:my_practice_bloc/features/homepage/data/models/resource_model.dart';

abstract class HomepageRemoteDatasource {
  Future<String> getProfile();
  Future<String> getResource();
  Future<List<HomepageDataModel>> getProfileList();
  Future<List<ResourceModel>> getResourceList();
  Future<List> getNameList({required int page});
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
  
  @override
  Future<List<ResourceModel>> getResourceList() async {
    final dio= Dio();
    try {
      final response= await dio.get('https://reqres.in/api/unknown');
      final resourceList= response.data['data'] as List<dynamic>;
      return ResourceModel.fromJsonList(resourceList);
    } catch(e) {
      throw Exception('Failed to load resource list: $e');
    }
  }
  
  @override
  Future<List> getNameList({required int page}) async {
    try {
      final dio= Dio();
      final response= await dio.get(
        'http://192.168.100.25:3000/student/read',
        options: Options(
          headers: {
            'Authorization': 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJ0ZWFjaGVyQGdtYWlsLmNvbSIsInJvbGUiOiJ0ZWFjaGVyIiwiaWF0IjoxNzMwNDY5NDc3LCJleHAiOjE3MzA0NzMwNzd9.T-_Q_-9Jbp5ud46Zzojg12NEUS0YT4lw5y_djFDkCdlEvOb1wbvg31YiikQ6jKM49aPr2ZtMFRasHdkTFMZufW_4QRrJxV6BRkjRzE34gnq92gfjEe19VE75CXjAUpjLFwhm7faU4Pjlb7JX1ZZaiBBQgSIkKTkkefIA_ihCXQjq-mVM9mZF4YrERUDVf8NJ3EsDL948nOIpE1SLkz1jczg7_1wux89x1wTVWrn3giaZlyu4uKmm6T29wtwtnH1XQ41ewoUfzxHosuxjwOOAxBf6K2JaOjlCwYuJDXSb7lp0xRw6wbw68S9LUk5W2I77npmHllPniFlNyKMXW_phht03yia-rD-ukZkFKkLTSZ540u3LLhofpQqfiDf0tZebDe_AIYo_VI0Qw4FcOTz0sLYVdksLNrq7TY3GD-65Oh_4kB43MdJqyVaYGgITjwNSIlWR0l8i4EX_hyFyCMfiq3cvZSlvmf3SKTPLlTltgYKM5OPFNN6m5wXg5gwvxrH4bWbeBP_jgBnINxJp1ZnqSBTrlzLeNRThvqG1swPvfIcW18FtOttZXOsaa04dtcLxzezZDfu-PkWRd7_kgWdcSS9AUUtQDNfnPHAo1Qt3U-l_P3NnbC5Vt9zETmBA8DAZXl4oNYU5HEdqrbYFm-1fSCXGjsqCMVOXfaPoGbTNp-U'
          },
        ),
        queryParameters: {
          'page': page
        }
      );
      final List nameList= response.data['payload'] as List;
      return nameList;
    } catch(e) {
      print(e);
      throw GeneralException(message: e.toString());
    }
  }
}