import 'package:allservice/di/dio_client/dio_client.dart';
import 'package:allservice/token/domain/token_refresh_request.dart';
import 'package:allservice/token/repository/token_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class JWTInterceptor extends QueuedInterceptor {
  final tokenRepository = GetIt.instance.get<TokenRepository>();

  final _dio = GetIt.instance.get<DioClient>().dio;

  String? get _accessToken => tokenRepository.accessToken;

  String? get _refreshToken => tokenRepository.refreshToken;

  @override
  void onRequest(options, handler) {
    if (_accessToken != null &&
        options.path != '/auth/api/token/' &&
        options.path != '/auth/api/token/refresh/' &&
        options.path != '/auth/login/' &&
        options.path != '/auth/register/' &&
        options.path != '/auth/reset-password/' &&
        options.path != '/auth/send-activation/' &&
        options.path != '/auth/verify/') {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.path.contains('/auth/register/') ||
        response.requestOptions.path == '/auth/login/') {
      tokenRepository.saveTokens(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );
    }

    super.onResponse(response, handler);
  }

  @override
  Future onError(err, handler) async {
    if ((err.response?.statusCode == 403 ||
            err.response?.statusCode == 401) &&
        (err.requestOptions.path != '/auth/register/' &&
            err.requestOptions.path != '/auth/login/')) {
      await _refresh();
      if (tokenRepository.auth) {
        final response = await _retry(err.requestOptions);
        handler.resolve(response);
      }
    }
    return super.onError(err, handler);
  }

  Future<void> _refresh() async {
    if (_refreshToken == null) {
      return;
    }

    try {
      final response = await _dio.post(
        '/auth/api/token/refresh/',
        data: TokenRefreshRequest(
          refresh: _refreshToken,
        ),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        tokenRepository.saveTokens(
          accessToken: response.data['accessToken'],
          refreshToken: response.data['refreshToken'],
        );
      }
    } catch (e) {
      tokenRepository.deleteTokens();
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}