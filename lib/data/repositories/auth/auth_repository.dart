import 'package:flutter/foundation.dart';

import '../../../config/auth_state.dart';
import '../../../utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  String? get sessionId;
  AuthState get authState;
  Future<bool> get isAuth;
  Future<Result<void>> login();
  Future<Result<void>> createSessionId(String requestToken);
  Future<Result<void>> logOut();
  Future<Result<void>> createGuestSession();
}