import 'package:flutter/cupertino.dart';
import 'package:swapi_app/views/ios/explore_view.dart';
import 'package:swapi_app/views/ios/film_view.dart';
import 'package:swapi_app/views/ios/people_view.dart';
import 'package:swapi_app/views/ios/planet_view.dart';
import 'package:swapi_app/views/ios/setting_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rectangle_3_offgrid),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_3),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.film),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.globe),
            label: 'Planets',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 1:
                return const PeopleView();
              case 2:
                return const FilmView();
              case 3:
                return const PlanetView();
              case 4:
                return const SettingView();
              default:
                return const ExploreView();
            }
          },
        );
      },
    );
  }
}
