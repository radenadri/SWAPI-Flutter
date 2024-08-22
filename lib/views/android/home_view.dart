import 'package:flutter/material.dart';
import 'package:swapi/config/constants.dart';
import 'package:swapi/views/android/character_view.dart';
import 'package:swapi/views/android/setting_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final pages = const [
    CharacterView(),
    SettingView(),
  ];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: COLOR_BLACK,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_3_outlined, color: COLOR_PRIMARY),
            label: 'Characters',
            selectedIcon: Icon(Icons.person_3, color: COLOR_PRIMARY),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined, color: COLOR_PRIMARY),
            label: 'Settings',
            selectedIcon: Icon(Icons.settings, color: COLOR_PRIMARY),
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
