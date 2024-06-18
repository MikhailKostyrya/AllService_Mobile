import 'package:allservice/token/interseptor/jwt_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:allservice/res/constants/constants.dart';

@singleton
class DioClient {
  late final Dio _dio = Dio();

  DioClient() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      contentType: Headers.jsonContentType,
      receiveTimeout: timeout,
      connectTimeout: timeout,
      sendTimeout: timeout,
    );
    _dio.interceptors.add(JWTInterceptor());
  }

  Dio get dio => _dio;
}