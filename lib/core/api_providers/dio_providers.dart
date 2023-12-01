import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseDioProvider = Provider((ref) {
  return Dio()
    ..interceptors.add(
      LogInterceptor(responseBody: true),
    );
});

final redditDioProvider = Provider((ref) {
  final baseDio = ref.watch(baseDioProvider);

  return baseDio
    ..options.baseUrl = 'https://www.reddit.com'
    ..options.headers['Content-Type'] = 'application/json';
});
