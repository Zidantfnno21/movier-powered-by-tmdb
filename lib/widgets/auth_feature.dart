import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/auth_state.dart';
import '../data/repositories/auth/auth_repository.dart';

class AuthFeature extends StatelessWidget {
  final Widget child;
  final Widget? placeholder;
  final List<AuthState> allowedStates;
  final VoidCallback? onUnauthorized;

  const AuthFeature({
    required this.child,
    this.placeholder,
    this.allowedStates = const [AuthState.authenticated],
    this.onUnauthorized,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthRepository>(
      builder: (context, authRepository, _) {
        final currentState = authRepository.authState;

        if (allowedStates.contains(currentState)) {
          return child;
        }

        return GestureDetector(
          onTap: () {
            if (onUnauthorized != null) {
              onUnauthorized!();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please login to access this feature'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: placeholder ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
