import 'package:go_router/go_router.dart';
import 'package:swapi_app/views/ios/counter_view.dart' as ios;
import 'package:swapi_app/views/ios/home_view.dart' as ios;
import 'package:swapi_app/views/ios/number_trivia_view.dart' as ios;
import 'package:swapi_app/views/ios/people_view.dart' as ios;
import 'package:swapi_app/views/android/home_view.dart' as android;

final iosRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const ios.HomeView(),
    ),
    GoRoute(
      name: 'peoples',
      path: '/peoples',
      builder: (context, state) => const ios.PeopleView(),
    ),
    GoRoute(
      name: 'counter',
      path: '/counter',
      builder: (context, state) => const ios.CounterView(),
    ),
    GoRoute(
      name: 'number_trivia',
      path: '/number_trivia',
      builder: (context, state) => const ios.NumberTriviaView(),
    ),
  ],
);

final androidRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const android.HomeView(),
    ),
  ],
);
