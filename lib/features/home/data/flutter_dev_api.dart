import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/api_providers/dio_providers.dart';
import 'package:flutter_riverpod_template/features/home/domain/recent_posts_response.dart';
import 'package:retrofit/retrofit.dart';

part 'flutter_dev_api.g.dart';

@RestApi()
abstract class FlutterDevApi {
  factory FlutterDevApi(Dio dio) = _FlutterDevApi;

  @GET('/r/flutterdev.json')
  Future<RecentPostsResponse> getRecentPosts({
    @Query('after') String? after,
    @Query('before') String? before,
  });
}

final flutterDevApiProvider = Provider.autoDispose((ref) {
  return FlutterDevApi(ref.watch(redditDioProvider));
});
