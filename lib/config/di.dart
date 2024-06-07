import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefs = FutureProvider<SharedPreferences>(
  (_) async => await SharedPreferences.getInstance(),
);

final dioProvider = Provider<Dio>((ref) => Dio());

final loggerProvider = Provider<Logger>((ref) => Logger());
