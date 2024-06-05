import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapi_app/config/routes.dart';
import 'package:swapi_app/config/constants.dart';

CupertinoThemeData starWarsTheme() {
  return const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: COLOR_PRIMARY,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(color: COLOR_PRIMARY),
    ),
    scaffoldBackgroundColor: COLOR_SECONDARY,
    barBackgroundColor: COLOR_BLACK,
  );
}

void main() {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    runApp(
      ProviderScope(
        child: CupertinoApp.router(
          routerConfig: iosRouter,
          title: 'Star Wars',
          theme: starWarsTheme(),
        ),
      ),
    );
  } else if (defaultTargetPlatform == TargetPlatform.android) {
    runApp(
      ProviderScope(
        child: MaterialApp.router(
          routerConfig: androidRouter,
          title: 'Star Wars',
          theme: ThemeData(
            colorSchemeSeed: Colors.green,
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
