import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapi/config/routes.dart';
import 'package:swapi/config/constants.dart';

CupertinoThemeData starWarsTheme() {
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

void main() {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    runApp(
      ProviderScope(
        child: CupertinoApp.router(
          routerConfig: iosRouter,
          title: APP_NAME,
          theme: starWarsTheme(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  } else if (defaultTargetPlatform == TargetPlatform.android) {
    runApp(
      ProviderScope(
        child: MaterialApp.router(
          routerConfig: androidRouter,
          title: APP_NAME,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorSchemeSeed: Colors.green,
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
