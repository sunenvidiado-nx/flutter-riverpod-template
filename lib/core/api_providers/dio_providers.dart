import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// coverage:ignore-start
final baseDioProvider = Provider((ref) {
  return Dio()
    ..interceptors.add(
      LogInterceptor(responseBody: true),
    );
});
// coverage:ignore-end

final redditDioProvider = Provider((ref) {
  final baseDio = ref.watch(baseDioProvider);

  return baseDio
    ..options.baseUrl = 'https://www.reddit.com'
    ..options.headers['Content-Type'] = 'application/json';
});
