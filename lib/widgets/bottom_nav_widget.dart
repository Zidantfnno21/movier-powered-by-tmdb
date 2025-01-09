import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:the_movie_databases/widgets/app_bar_widget.dart';

import '../data/repositories/auth/auth_repository.dart';

class BottomNavigation extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavigation({super.key, required this.navigationShell});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
        selectedLabelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
        unselectedItemColor:
            Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (index) async {
          if (index == 4) {
            final authState = await context.read<AuthRepository>().authState;

            if (!authState.isAuthenticated && context.mounted) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Authentication Required'),
                  content: const Text('Please login to view your favorites'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              );
              return;
            }
          }

          widget.navigationShell.goBranch(index,
              initialLocation: index == widget.navigationShell.currentIndex);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              widget.navigationShell.currentIndex == 0
                  ? Icons.home
                  : Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              widget.navigationShell.currentIndex == 1
                  ? Icons.movie
                  : Icons.movie_outlined,
            ),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              widget.navigationShell.currentIndex == 2
                  ? Icons.local_movies
                  : Icons.local_movies_outlined,
            ),
            label: 'Tv Shows',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              widget.navigationShell.currentIndex == 3
                  ? Icons.star
                  : Icons.star_border_rounded,
            ),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              widget.navigationShell.currentIndex == 4
                  ? Icons.favorite
                  : Icons.favorite_border_rounded,
            ),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
