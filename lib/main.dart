import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapi/config/routes.dart';
import 'package:swapi/config/constants.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class NavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();
}

CupertinoThemeData starWarsCupertinoTheme() {
  return const CupertinoThemeData(
    applyThemeToAll: true,
    barBackgroundColor: COLOR_BLACK,
    brightness: Brightness.dark,
    primaryColor: COLOR_PRIMARY,
    scaffoldBackgroundColor: COLOR_SECONDARY,
    textTheme: CupertinoTextThemeData(
      primaryColor: COLOR_PRIMARY,
      textStyle: TextStyle(color: COLOR_PRIMARY),
    ),
  );
}

ThemeData starWarsMaterialTheme() {
  return ThemeData(
    // for getting the current platform's brightness
    // brightness: SchedulerBinding.instance.platformDispatcher.platformBrightness,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: COLOR_SECONDARY,
    colorSchemeSeed: COLOR_PRIMARY,
    cardTheme: const CardTheme(
      color: COLOR_SECONDARY,
      elevation: 0.0,
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        color: COLOR_PRIMARY,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (Set<WidgetState> states) => states.contains(WidgetState.selected)
            ? const TextStyle(color: COLOR_PRIMARY)
            : const TextStyle(color: COLOR_PRIMARY),
      ),
    ),
    useMaterial3: true,
  );
}

void main() {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    runApp(
      ProviderScope(
        child: CupertinoApp.router(
          routerConfig: iosRouter,
          title: APP_NAME,
          theme: starWarsCupertinoTheme(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  } else if (defaultTargetPlatform == TargetPlatform.android) {
    WidgetsFlutterBinding.ensureInitialized();

    // if debug mode is enabled, enable wakelock to prevent the screen from sleeping
    if (kDebugMode) {
      WakelockPlus.enable();
    }

    runApp(
      ProviderScope(
        child: MaterialApp.router(
          routerConfig: androidRouter,
          title: APP_NAME,
          debugShowCheckedModeBanner: false,
          theme: starWarsMaterialTheme(),
        ),
      ),
    );
  }
}
