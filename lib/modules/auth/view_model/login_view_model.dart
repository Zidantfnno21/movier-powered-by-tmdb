import 'dart:async';
import 'dart:ui';

import 'package:app_links/app_links.dart';
import 'package:logging/logging.dart';
import 'package:the_movie_databases/data/repositories/auth/auth_repository.dart';

import '../../../utils/result.dart';

class LoginViewModel {
  LoginViewModel({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;
  StreamSubscription<Uri?>? _deepLinkSubscription;
  final _log = Logger('LoginViewModel');

  void listenToDeepLink({
    required Function(String sessionId) onSessionCreated,
    required Function(Object error) onError,
  }) {
    _deepLinkSubscription = AppLinks().uriLinkStream.listen(
      (Uri? uri) async {
        if (uri != null) {
          final result = await _handeDeepLink(uri);
          if (result is Error<void>) {
            onError(result.error);
          }
          if (result is Ok<void>) {
            onSessionCreated('Session created successfully');
          }
        }
      },
      onError: (error) {
        onError(error.toString());
      },
    );
  }

  Future<Result<void>> startTmdbAuth({
    Function(Object error)? onError,
    Function(bool isLoading)? setIsLoading,
    VoidCallback? onBrowserOpened,
  }) async {
    setIsLoading?.call(true);
    try {
      final result = await _authRepository.login();
      if (result is Error<void>) {
        _log.warning('Login failed! ${result.error}');
        onError?.call(result.error);
      } else {
        onBrowserOpened?.call();
      }
      return result;
    } finally {
      setIsLoading?.call(false);
    }
  }

  Future<Result<void>> createGuestSession({
    Function(Object error)? onError,
    Function(bool isLoading)? setIsLoading,
  }) async {
    setIsLoading?.call(true);
    try {
      final result = await _authRepository.createGuestSession();
      if (result is Error<void>) {
        _log.warning('Create guest session failed! ${result.error}');
        onError?.call(result.error);
      } else {
        _log.info('Create guest session success!');
      }
    
      return result;
    } finally {
      setIsLoading?.call(false);
    }
  }

  Future<Result<void>> _handeDeepLink(Uri uri) async {
    final isApproved = uri.queryParameters['approved'] == 'true';
    final requestToken = uri.queryParameters['request_token'];

    if (isApproved && requestToken != null) {
      final result = await _authRepository.createSessionId(requestToken);
      if (result is Error<void>) {
        _log.warning('Create session failed! ${result.error}');
      }
      _log.info('Session created successfully');
      return const Result.ok(null);
    } else {
      _log.warning('Token not approved or missing request token.');
      return Result.error(
          Exception('Token not approved or missing request token.'));
    }
  }

  void dispose() {
    _deepLinkSubscription?.cancel();
  }
}
