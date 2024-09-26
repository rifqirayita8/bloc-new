import 'package:dio/dio.dart';
import 'package:my_practice_bloc/core/services/shared_preferences.dart';
import 'package:my_practice_bloc/injection.dart';

class MyInterceptor extends Interceptor {
  final SharedPreferencesHelper _sharedPreferencesHelper;

  MyInterceptor() : _sharedPreferencesHelper= myInjection<SharedPreferencesHelper>();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final String? url= await _sharedPreferencesHelper.getUrl();

    if (url != null) {
      options.baseUrl= url;
    }
    options.connectTimeout= const Duration(seconds: 10);
    options.receiveTimeout= const Duration(seconds: 10);
    options.headers= {
      'Content-Type': 'application/json',
    };

    return super.onRequest(options, handler);
  }
}