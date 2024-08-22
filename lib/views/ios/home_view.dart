import 'package:flutter/cupertino.dart';
import 'package:swapi/views/ios/character_view.dart';
import 'package:swapi/views/ios/setting_view.dart';

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
            icon: Icon(CupertinoIcons.person_3),
            label: 'Characters',
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
              case 0:
                return const CharacterView();
              default:
                return const SettingView();
            }
          },
        );
      },
    );
  }
}
