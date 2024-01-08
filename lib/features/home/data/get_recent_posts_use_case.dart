import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/api_providers/dio_providers.dart';
import 'package:flutter_riverpod_template/features/home/domain/recent_posts_response.dart';
import 'package:retrofit/retrofit.dart';

part 'get_recent_posts_use_case.g.dart';

@RestApi()
abstract class GetRecentPostsUseCase {
  factory GetRecentPostsUseCase(Dio dio) = _GetRecentPostsUseCase;

  @GET('/r/flutterdev.json')
  Future<RecentPostsResponse> run({
    @Query('after') String? after,
    @Query('before') String? before,
  });
}

final getRecentPostsUseCaseProvider = Provider.autoDispose((ref) {
  final dio = ref.read(redditDioProvider);
  return GetRecentPostsUseCase(dio);
});
