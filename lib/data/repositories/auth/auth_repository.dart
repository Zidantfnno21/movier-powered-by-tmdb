import 'package:flutter/foundation.dart';

import '../../../config/auth_state.dart';
import '../../../utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  Map<String, String?>? get region;
  String? get sessionId;
  Future<AuthState> get authState;
  Future<Result<void>> login();
  Future<Result<void>> createSessionId(String requestToken);
  Future<Result<void>> logOut();
  Future<Result<void>> createGuestSession();
}