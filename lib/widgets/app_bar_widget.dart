import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_databases/data/repositories/account/account_repository.dart';

import '../config/routes.dart';
import '../data/local/databases/entity/account/account_details.dart';
import '../data/repositories/auth/auth_repository.dart';

import '../utils/result.dart';
import '../utils/theme_provider.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      actions: [
        _buildIconButton(
          context,
          icon: const Icon(
            Icons.search,
          ),
          onPressed: () {
            context.push(Routes.search);
          },
        ),
        _buildThemeButton(context),
        _buildProfileButton(context, onPressed: () {
          _onProfileClicked(context);
        })
      ],
      title: _buildTitle(context),
    );
  }

  Future<String?>? _countryNameTitle;

  Future<String?> _fetchUserLocation(BuildContext context) async {
    final authRepository = context.read<AuthRepository>();
    final region = authRepository.region;

    if (region != null) {
      final Map<String, String?> locationData = region;
      final countryName = locationData.keys.first;
      print('Country name fetched from provider: $countryName');
      return countryName;
    } else {
      print('isoCountryCodeProvider is null.');
      return null;
    }
  }

  Widget _buildTitle(BuildContext context) {
    _countryNameTitle ??= _fetchUserLocation(context);

    return FutureBuilder<String?>(
      future: _countryNameTitle,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SafeArea(
            child: Row(
              children: [
                Text(
                  'Fetching location...',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return SafeArea(
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Error fetching location',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                        onPressed: () async {
                          _fetchUserLocation(context);
                        },
                        child: Text('retry'))
                  ],
                ),
              ],
            ),
          );
        } else {
          final userLocation = snapshot.data ?? '';
          return SafeArea(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userLocation.isNotEmpty ? 'Location' : '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      userLocation,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildIconButton(BuildContext context,
      {required Icon icon, required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 8), // Margin for spacing between icons
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildProfileButton(BuildContext context,
      {required VoidCallback onPressed}) {
    _avatarUrlFuture ??= _getAvatarUrl(context);

    return FutureBuilder<String?>(
      future: _avatarUrlFuture,
      builder: (context, snapshot) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
            onTap: onPressed,
            child: ClipOval(
              child: snapshot.connectionState == ConnectionState.waiting
                  ? SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    )
                  : CachedNetworkImage(
                      key: ValueKey(snapshot.data),
                      imageUrl: snapshot.data ?? '',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Icon(
                        Icons.account_circle_rounded,
                        size: 50,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.account_circle_rounded,
                        size: 50,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Future<String?>? _avatarUrlFuture;

  Future<String?> _getAvatarUrl(BuildContext context) async {
    final accountRepository = context.read<AccountRepository>();
    final result = await accountRepository.fetchAccount();

    if (result is Ok<AccountDetails>) {
      final accountDetails = result.value;

      if (accountDetails.avatar.tmdb?.avatarPath?.isNotEmpty == true) {
        final tmdbUrl =
            'https://image.tmdb.org/t/p/w500${accountDetails.avatar.tmdb!.avatarPath}';
        return tmdbUrl;
      }

      if (accountDetails.avatar.gravatar.hash.isNotEmpty) {
        final gravatarUrl =
            'https://www.gravatar.com/avatar/${accountDetails.avatar.gravatar.hash}';
        return gravatarUrl;
      }
    }

    return null;
  }

  void _onProfileClicked(BuildContext context) {
    showMenu(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            color: Theme.of(context).canvasColor,
            context: context,
            position: const RelativeRect.fromLTRB(90.0, 90.0, 0.0, 50.0),
            items: [
              const PopupMenuItem<String>(
                value: 'Profile',
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 8),
                    Text('Account'),
                  ],
                ),
              ),
              // const PopupMenuItem<String>(
              //   value: 'Settings',
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.settings,
              //       ),
              //       SizedBox(width: 8),
              //       Text('Settings'),
              //     ],
              //   ),
              // ),
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
            elevation: 10.0,
            clipBehavior: Clip.antiAliasWithSaveLayer)
        .then((value) {
      if (value != null) {
        _handleMenuSelection(value, context);
      }
    });
  }

  void _handleMenuSelection(String value, BuildContext context) async {
    final authState = await context.read<AuthRepository>().authState;
    if (context.mounted) {
      switch (value) {
        case 'Profile':
          if (authState.isAuthenticated) {
            context.push(Routes.profile);
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Authentication Required'),
                content: const Text('Please login to view your profile'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          }
          break;
        case 'Settings':
          context.push(Routes.settings);
          break;
        case 'Logout':
          _handleLogoutPressed(context);
          break;
      }
    }
  }

  void _handleLogoutPressed(BuildContext context) async {
    final authRepository = context.read<AuthRepository>();
    final result = await authRepository.logOut();

    switch (result) {
      case Ok<void>():
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logged out successfully')),
          );
          context.go(Routes.auth);
        }
        break;
      case Error<void>():
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something wrong happen!')),
          );
        }
        break;
    }
  }

  Widget _buildThemeButton(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    return _buildIconButton(
      context,
      icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
      onPressed: () {
        themeProvider.updateTheme(isDark ? 'light' : 'dark');
      },
    );
  }
}
