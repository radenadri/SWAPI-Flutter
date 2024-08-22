import 'package:go_router/go_router.dart';
import 'package:swapi/views/splash_screen_view.dart';
import 'package:swapi/views/ios/home_view.dart' as ios;
import 'package:swapi/views/ios/character_view.dart' as ios;
import 'package:swapi/views/ios/character_detail_view.dart' as ios;
import 'package:swapi/views/android/home_view.dart' as android;
import 'package:swapi/views/android/character_view.dart' as android;
import 'package:swapi/views/android/character_detail_view.dart' as android;

final iosRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'splashscreen',
      path: '/',
      builder: (context, state) => const SplashScreenView(),
    ),
    GoRoute(
      name: 'home',
      path: '/homepage',
      builder: (context, state) => const ios.HomeView(),
    ),
    GoRoute(
      name: 'characters',
      path: '/characters',
      builder: (context, state) => const ios.CharacterView(),
    ),
    GoRoute(
      name: 'character_detail',
      path: '/characters/:id',
      builder: (context, state) => ios.CharacterDetailView(
        id: state.pathParameters['id']!,
      ),
    ),
  ],
);

final androidRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'splashscreen',
      path: '/',
      builder: (context, state) => const SplashScreenView(),
    ),
    GoRoute(
      name: 'home',
      path: '/homepage',
      builder: (context, state) => const android.HomeView(),
    ),
    GoRoute(
      name: 'characters',
      path: '/characters',
      builder: (context, state) => const android.CharacterView(),
    ),
    GoRoute(
      name: 'character_detail',
      path: '/characters/:id',
      builder: (context, state) => android.CharacterDetailView(
        id: state.pathParameters['id']!,
      ),
    ),
  ],
);
