import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/repositories/auth/auth_repository.dart';
import '../config/auth_state.dart';

extension AuthContextExtension on BuildContext {
  AuthRepository get auth => read<AuthRepository>();
  AuthState get authState => watch<AuthRepository>().authState;

  bool get isAuthenticated => read<AuthRepository>().authState == AuthState.authenticated;
  bool get isGuest => read<AuthRepository>().authState == AuthState.guestSession;
  bool get isUnauthenticated => read<AuthRepository>().authState == AuthState.unauthenticated;
}