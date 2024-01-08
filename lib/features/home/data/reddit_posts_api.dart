import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/api_providers/dio_providers.dart';
import 'package:flutter_riverpod_template/features/home/domain/recent_posts_response.dart';
import 'package:retrofit/retrofit.dart';

part 'reddit_posts_api.g.dart';

@RestApi()
abstract class RedditPostsApi {
  factory RedditPostsApi(Dio dio) = _RedditPostsApi;

  @GET('/r/flutterdev.json')
  Future<RecentPostsResponse> getRecentPosts();
}

final redditPostsApiProvider = Provider.autoDispose((ref) {
  final dio = ref.read(redditDioProvider);
  return RedditPostsApi(dio);
});
