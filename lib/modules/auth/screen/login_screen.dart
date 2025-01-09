import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_databases/modules/auth/view_model/login_view_model.dart';

import '../../../config/routes.dart';
import '../../../utils/result.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool _isButtonLoading = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  Future<void> _handleLogin() async {
    try {
      await widget.viewModel.startTmdbAuth(
        setIsLoading: (isLoading) {
          setState(() {
            _isButtonLoading = isLoading;
          });
        },
        onError: (error) {
          _showErrorDialog(context, 'Error occurred while trying to login!');
        },
        onBrowserOpened: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Opening Browser for login...'),
              duration: Duration(seconds: 3),
            ),
          );
        },
      );
    } finally {
      if (mounted) {
        setState(() {
          _isButtonLoading = false;
        });
      }
    }
  }

  Future<void> _handleGuestSession() async {
    final result = await widget.viewModel.createGuestSession(
      setIsLoading: (isLoading) {
        setState(() {
          _isButtonLoading = isLoading;
        });
      },
      onError: (error) {
        _showErrorDialog(context, 'Error occurred while trying to login!');
      },
    );

    if (result is Ok<void>) {
      if (mounted) {
        context.go(Routes.home);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent status bar
        statusBarIconBrightness: Brightness.light, // White icons
      ),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40), // Controls animation speed
    )..repeat(reverse: true);
    _initDeepLinkListener();

    _animation = Tween<double>(begin: -4.0, end: 5 * pi).animate(_controller);
  }

  void _initDeepLinkListener() {
    widget.viewModel.listenToDeepLink(
      onSessionCreated: (sessionId) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Permission Granted!')));
        }
        context.go(Routes.home);
      },
      onError: (onError) {
        if (mounted) {
          _showErrorDialog(
              context, 'Error occurred while creating session: $onError');
        }
      },
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {

          final double x = cos(_animation.value);
          final double y = sin(_animation.value);

          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(x, y),
                    radius: 2.8,
                    colors: [
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.primary,
                    ],
                    stops: const [-4.0, 0.0, 4.0],
                  ),
                ),
              ),
              // Main content
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome to TMDB',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Login to access your account and explore movies!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _isButtonLoading
                            ? null
                            : () async {
                                await _handleLogin();
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(200, 48),
                        ),
                        child: _isButtonLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const Text(
                                'Login with TMDB',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () async {
                          await _handleGuestSession();
                        }, // Replace with guest mode logic
                        child: const Text(
                          'Continue as Guest',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
