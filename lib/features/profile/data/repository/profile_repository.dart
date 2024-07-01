import 'package:allservice/features/profile/data/domain/profile_request.dart';
import 'package:allservice/features/profile/data/model/user.dart';
import 'package:allservice/features/profile/data/service/profile_service.dart';

class ProfileRepository {
  final ProfileService _profileService;

  ProfileRepository(this._profileService);

  Future<User> getUserProfile({
    required ProfileRequest request,
  }) async {
    try {
      return await _profileService.fetchUserProfile(request: request);
    } catch (e) {
      throw Exception('Failed to load user profile: $e');
    }
  }

  Future<User> updateUserProfile({
    required ProfileUpdateRequest request,
  }) async {
    try {
      final result = await _profileService.updateUserProfile(
        request: request,
      );
      return result;
    } catch (e, s) {
      throw Error.throwWithStackTrace(e, s);
    }
  }
}
