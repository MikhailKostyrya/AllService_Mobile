import 'package:allservice/features/authorization/data/repository/auth_repository.dart';
import 'package:allservice/features/authorization/data/service/auth_service.dart';
import 'package:allservice/res/constants/constants.dart';
import 'package:allservice/token/interseptor/jwt_interceptor.dart';
import 'package:allservice/token/repository/token_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class Dependencies {
  final Dio dio = Dio();

  late final AuthService _authService = AuthService(dio);

  late final TokenRepository tokenRepository = TokenRepository();
  late final AuthRepository authRepository = AuthRepository(_authService);

  @postConstruct
  Future<void> init() async {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      contentType: Headers.jsonContentType,
      receiveTimeout: timeout,
      connectTimeout: timeout,
      sendTimeout: timeout,
    );

    await tokenRepository.initTokens();

    dio.interceptors.add(JWTInterceptor(dio, tokenRepository));
  }
}
