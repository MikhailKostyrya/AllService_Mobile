import 'package:allservice/features/profile/data/domain/profile_request.dart';
import 'package:allservice/features/profile/data/model/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio) = _ProfileService;

  @GET('/users/profile/update/')
  Future<User> fetchUserProfile({
    @Body() required ProfileRequest request,
  });

  @PUT('/users/profile/update/')
  Future<User> updateUserProfile({
    @Body() required ProfileUpdateRequest request,
  });
}
