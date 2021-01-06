import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:keretaapp/constant.dart';
import 'package:keretaapp/data/local/app_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: prefer_mixin
class AppDio with DioMixin implements Dio {
  AppSharedPreferences sharedPreferences = new AppSharedPreferences();

  AppDio._([BaseOptions options]) {
    options = BaseOptions(
      baseUrl: Constants.of().endpoint,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    interceptors.add(InterceptorsWrapper(onRequest: (options) async {
      options.headers['Authorization'] =
          "Bearer ${(await sharedPreferences.getInstance()).getString('auth_jwt')}";
    }));

    // API Cache
    interceptors.add(DioCacheManager(
      CacheConfig(
        baseUrl: Constants.of().endpoint,
      ),
    ).interceptor);

    if (kDebugMode) {
      // Local Log
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
