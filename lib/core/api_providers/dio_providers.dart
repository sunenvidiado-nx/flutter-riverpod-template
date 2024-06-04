import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// coverage:ignore-start
final baseDioProvider = Provider((ref) {
  final dio = Dio();

  if (kDebugMode) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: false,
    ));
  }

  return dio;
});
// coverage:ignore-end

final redditDioProvider = Provider((ref) {
  final baseDio = ref.watch(baseDioProvider);

  return baseDio
    ..options.baseUrl = 'https://www.reddit.com'
    ..options.headers['Content-Type'] = 'application/json';
});
