import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenRepository extends ChangeNotifier {
  TokenRepository({
    bool useCaching = true,
  }) : _useCaching = useCaching;

  bool get auth => _refreshToken != null;

  String? get accessToken => _accessToken;

  String? get refreshToken => _refreshToken;

  String? _accessToken;

  String? _refreshToken;

  final bool _useCaching;

  final _secureStorage = const FlutterSecureStorage();

  @postConstruct
  Future<void> initTokens() async {
    if (_useCaching) {
      _accessToken = await _secureStorage.read(key: 'accessToken');
      _refreshToken = await _secureStorage.read(key: 'refreshToken');
    }
    notifyListeners();
  }

  Future<void> deleteTokens() async {
    _accessToken = null;
    _refreshToken = null;

    notifyListeners();

    if (_useCaching) {
      await _secureStorage.delete(key: 'accessToken');
      await _secureStorage.delete(key: 'refreshToken');
    }
  }

  void saveTokens({
    required String accessToken,
    required String refreshToken,
  }) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    notifyListeners();
    if (_useCaching) {
      _persistTokens();
    }
  }

  Future<void> _persistTokens() async {
    await _secureStorage.write(key: 'accessToken', value: _accessToken);
    await _secureStorage.write(key: 'refreshToken', value: _refreshToken);
  }
}
