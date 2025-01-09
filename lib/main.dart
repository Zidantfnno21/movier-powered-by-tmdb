import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_databases/data/local/databases/app_databases.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client_impl.dart';
import 'package:the_movie_databases/data/network/service/tmdb_service.dart';
import 'package:the_movie_databases/data/repositories/account/account_repository.dart';
import 'package:the_movie_databases/data/repositories/account/account_repository_impl.dart';
import 'package:the_movie_databases/data/repositories/auth/auth_repository.dart';
import 'package:the_movie_databases/data/repositories/auth/auth_repository_impl.dart';
import 'package:the_movie_databases/data/repositories/details/details_repository.dart';
import 'package:the_movie_databases/data/repositories/details/details_repository_impl.dart';
import 'package:the_movie_databases/data/repositories/movies/movies_repository.dart';
import 'package:the_movie_databases/data/repositories/movies/movies_repository_impl.dart';
import 'package:the_movie_databases/data/repositories/people/people_repository.dart';
import 'package:the_movie_databases/data/repositories/people/people_repository_impl.dart';
import 'package:the_movie_databases/data/repositories/tv_shows/tv_shows_repository.dart';
import 'package:the_movie_databases/data/repositories/tv_shows/tv_shows_repository_impl.dart';
import 'package:the_movie_databases/data/shared_preferences_service.dart';
import 'package:the_movie_databases/modules/account/screen/account_screen.dart';
import 'package:the_movie_databases/modules/account/view_model/account_view_model.dart';
import 'package:the_movie_databases/modules/auth/screen/login_screen.dart';
import 'package:the_movie_databases/modules/details/screen/cast_screen.dart';
import 'package:the_movie_databases/modules/details/view_model/details_view_model.dart';
import 'package:the_movie_databases/modules/details/screen/details_screen.dart';
import 'package:the_movie_databases/modules/home/view_model/home_view_model.dart';
import 'package:the_movie_databases/modules/movies/view_model/movies_view_model.dart';
import 'package:the_movie_databases/modules/people/view_model/people_view_model.dart';
import 'package:the_movie_databases/modules/search/screen/search_screen.dart';
import 'package:the_movie_databases/modules/tv_shows/view_model/tv_shows_view_model.dart';
import 'package:the_movie_databases/widgets/bottom_nav_widget.dart';
import 'package:the_movie_databases/modules/favourites/screen/favourites_screen.dart';
import 'package:the_movie_databases/modules/home/screen/home_screen.dart';
import 'package:the_movie_databases/modules/movies/screen/movies_screen.dart';
import 'package:the_movie_databases/config/routes.dart';
import 'package:the_movie_databases/config/theme.dart';
import 'package:the_movie_databases/modules/tv_shows/screen/tv_shows_screen.dart';

import 'config/auth_state.dart';
import 'data/repositories/favourites/favourites_repository.dart';
import 'data/repositories/favourites/favourites_respository_impl.dart';
import 'data/repositories/search/search_repository.dart';
import 'data/repositories/search/search_repository_impl.dart';
import 'modules/auth/view_model/login_view_model.dart';
import 'modules/favourites/view_model/favourites_view_model.dart';
import 'modules/people/screen/people_screen.dart';
import 'modules/search/view_model/search_view_model.dart';
import 'utils/theme_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  Logger.root.level = Level.ALL;

  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabases.databaseBuilder('app_database.db').build();

  runApp(
    MultiProvider(
      providers: [
        Provider<TmdbClient>(create: (context) => TmdbClientImpl()),
        FutureProvider<AppDatabases>(
            create: (context) async => database, initialData: database),
        Provider<SharedPreferencesService>(
            create: (context) => SharedPreferencesService()),
        Provider<TmdbService>(create: (context) => TmdbService()),
        ChangeNotifierProvider(
            create: (context) =>
                HomeViewModel(tmdbClient: context.read<TmdbClient>())),
        Provider(
            create: (context) =>
                TvShowsRepositoryImpl(tmdbClient: context.read<TmdbClient>())
                    as TvShowsRepository),
        Provider(
            create: (context) => PeopleRepositoryImpl(
                    tmdbClient: context.read<TmdbClient>(),
                    appDatabases: context.read<AppDatabases>())
                as PeopleRepository),
        Provider(
            create: (context) => DetailsRepositoryImpl(
                  tmdbClient: context.read<TmdbClient>(),
                ) as DetailsRepository,
            lazy: false),
        ChangeNotifierProvider(
            create: (context) => AuthRepositoryImpl(
                  tmdbService: context.read<TmdbService>(),
                  sharedPreferencesService:
                      context.read<SharedPreferencesService>(),
                  tmdbClient: context.read<TmdbClient>(),
                  appDatabase: context.read<AppDatabases>(),
                ) as AuthRepository),
        Provider(
            create: (context) => AccountRepositoryImpl(
                appDatabases: context.read<AppDatabases>(),
                tmdbClient: context.read<TmdbClient>(),
                sharedPreferencesService: context
                    .read<SharedPreferencesService>()) as AccountRepository),
        Provider(
            create: (context) =>
                SearchRepositoryImpl(context.read<TmdbClient>())
                    as SearchRepository),
        ChangeNotifierProvider(
          create: (context) =>
              ThemeProvider(context.read<SharedPreferencesService>()),
        ),
        Provider(
            create: (context) => FavouritesRepositoryImpl(
                tmdbClient: context.read<TmdbClient>(),
                sharedPreferencesService: context
                    .read<SharedPreferencesService>()) as FavouritesRepository),
        Provider(
            create: (context) => MoviesRepositoryImpl(
                    tmdbClient: context.read<TmdbClient>(),
                    appDatabases: context.read<AppDatabases>())
                as MoviesRepository),
      ],
      child: const MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> parentNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> moviesNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> tvShowsNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> personNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> favouritesNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> detailsNavigatorKey =
    GlobalKey<NavigatorState>();

GoRouter _router(AuthRepository authRepository) => GoRouter(
        navigatorKey: parentNavigatorKey,
        initialLocation: Routes.home,
        debugLogDiagnostics: true,
        redirect: _redirect,
        refreshListenable: authRepository,
        routes: [
          GoRoute(
            path: Routes.detail,
            pageBuilder: (context, state) {
              final data = state.extra;
              final viewModel = DetailsViewModel(
                  detailsRepository: context.read(),
                  favouritesRepository: context.read(),
                  sharedPreferencesService: context.read());
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(
                      animation,
                    ),
                    child: child,
                  );
                },
                child: DetailsScreen(data: data, viewModel: viewModel),
              );
            },
            // builder: (context, state) {
            //   final data = state.extra;
            //   final viewModel = DetailsViewModel(
            //     detailsRepository: context.read(),
            //     favouritesRepository: context.read(),
            //     sharedPreferencesService: context.read(),
            //   );
            //   return DetailsScreen(data: data, viewModel: viewModel);
            // }
          ),
          GoRoute(
              path: Routes.auth,
              builder: (context, state) {
                final viewModel =
                    LoginViewModel(authRepository: context.read());
                return LoginScreen(viewModel: viewModel);
              }),
          GoRoute(
              path: Routes.profile,
              builder: (context, state) {
                final viewModel = AccountViewModel(
                    accountRepository: context.read(),
                    authRepository: context.read());
                return AccountScreen(
                  viewModel: viewModel,
                );
              }),
          GoRoute(
              path: Routes.search,
              // pageBuilder: (context, state) {
              //   final viewModel =
              //       SearchViewModel(context.read<SearchRepository>());
              //   return CustomTransitionPage(
              //     transitionsBuilder:
              //         (context, animation, secondaryAnimation, child) {
              //       return FadeTransition(opacity: animation, child: child);
              //     },
              //     child: SearchScreen(viewModel: viewModel,),
              //   );
              // },
              builder: (context, state) {
                final viewModel = SearchViewModel(context.read());
                return SearchScreen(viewModel: viewModel);
              }),
          GoRoute(
              path: Routes.cast,
              builder: (context, state) {
                final data = state.extra as List;
                return CastScreen(cast: data);
              }),
          StatefulShellRoute.indexedStack(
            parentNavigatorKey: parentNavigatorKey,
            branches: [
              StatefulShellBranch(navigatorKey: homeNavigatorKey, routes: [
                GoRoute(
                    path: Routes.home,
                    builder: (context, state) {
                      return const HomeScreen();
                    })
              ]),
              StatefulShellBranch(navigatorKey: moviesNavigatorKey, routes: [
                GoRoute(
                  path: Routes.movies,
                  builder: (context, state) {
                    final viewModel = MoviesViewModel(
                        moviesRepository: context.read<MoviesRepository>());
                    return MoviesScreen(moviesViewModel: viewModel);
                  },
                )
              ]),
              StatefulShellBranch(navigatorKey: tvShowsNavigatorKey, routes: [
                GoRoute(
                  path: Routes.tvShows,
                  builder: (context, state) {
                    final viewModel =
                        TvShowsViewModel(tvShowRepos: context.read());
                    return TvShowsScreen(viewModel: viewModel);
                  },
                )
              ]),
              StatefulShellBranch(navigatorKey: personNavigatorKey, routes: [
                GoRoute(
                  path: Routes.person,
                  builder: (context, state) {
                    final viewModel =
                        PeopleViewModel(peopleRepository: context.read());
                    return PeopleScreen(
                      viewModel: viewModel,
                    );
                  },
                )
              ]),
              StatefulShellBranch(
                  navigatorKey: favouritesNavigatorKey,
                  routes: [
                    GoRoute(
                      path: Routes.favourites,
                      pageBuilder: (context, state) {
                        final viewModel = FavouritesViewModel(
                          favouritesRepository: context.read(),
                        );
                        return CustomTransitionPage(
                          key: state.pageKey,
                          child: FavouritesScreen(
                            viewModel: viewModel,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        );
                      },
                    ),
                  ])
            ],
            pageBuilder: (context, state, navigationShell) {
              return MaterialPage(
                  child: BottomNavigation(
                    navigationShell: navigationShell,
                  ),
                  key: state.pageKey);
            },
          ),
        ]);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final authRepository = context.read<AuthRepository>();
  final bool loggingIn = state.matchedLocation == Routes.auth;

  switch (await authRepository.authState) {
    case AuthState.unauthenticated when !loggingIn:
      return Routes.auth;
    case AuthState.authenticated when loggingIn:
      return Routes.home;
    case AuthState.guestSession when loggingIn:
      return Routes.home;
    default:
      return null;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> _initializeApp(BuildContext context) async {
    await Future.wait([
      Future.delayed(Duration(seconds: 10)),
      context.read<AuthRepository>().authState,
      context.read<ThemeProvider>().themeMode,
      Future.value(context.read<AuthRepository>().region?.isNotEmpty ?? false),
      Future.value(context.read<TmdbClient>().isoCountryCodeProvider != null),
    ] as Iterable<Future>);
  }

  @override
  Widget build(BuildContext context) {
    final routes = _router(context.read<AuthRepository>());

    return FutureBuilder(
      future: _initializeApp(context),
      builder: (context, snapshot) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) {
            return MaterialApp.router(
              title: 'The movie db',
              debugShowCheckedModeBanner: false,
              routerConfig: routes,
              builder: (context, child) {
                return Stack(
                  children: [

                    Theme(
                      data: themeProvider.themeMode == ThemeMode.dark
                          ? darkTheme
                          : lightTheme,
                      child: child!,
                    ),

                    if (snapshot.connectionState == ConnectionState.active)
                      Positioned.fill(
                        child: Container(
                          color: Colors.black.withOpacity(1.0), // Semi-transparent overlay
                          child: const Center(
                            child: CircularProgressIndicator(), // Modal loader
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

}
