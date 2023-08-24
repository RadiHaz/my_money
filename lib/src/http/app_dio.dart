import 'dart:developer';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

mixin AppDio {
  static Future<Dio> getConnection({bool isAuth = false}) async {
    final Dio dio = Dio();

    final Map<String, String> headers = <String, String>{};

    String token = "";

    if (isAuth) {
      headers["authorization"] = "Bearer $token";
    }

    dio.options = BaseOptions();
    dio.options.receiveTimeout = 30000;
    dio.options.sendTimeout = 12000;
    dio.options.headers = headers;

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
      return null;
    };

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      onRequest(options);
      handler.next(options);
    }
    , onResponse: onResponse,
      onError: (error, handler) async {
          onError(dio, error, handler);
      }
    ));

    return dio;
  }

  static void onRequest(RequestOptions options) {
    options.headers["Accept"] = 'application/json';
    options.headers["Content-Type"] = 'application/json';

    log('---------------| Request Log |---------------');
    log(options.uri as String);
  }

  static void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    log('---------------| Response Log |---------------');
    log(response.data as String);
    handler.next(response);
  }

  static void onError(Dio dio, DioError error, ErrorInterceptorHandler handler) {
    log('---------------| Error Log |---------------');
    log('$error');
    handler.next(error);
  }
}
