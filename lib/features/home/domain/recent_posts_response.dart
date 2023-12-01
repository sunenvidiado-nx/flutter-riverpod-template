import 'package:flutter_riverpod_template/features/home/domain/recent_posts_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_posts_response.freezed.dart';
part 'recent_posts_response.g.dart';

@freezed
class RecentPostsResponse with _$RecentPostsResponse {
  const factory RecentPostsResponse(String kind, RecentPostsData data) =
      _RecentPostsResponse;

  factory RecentPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentPostsResponseFromJson(json);
}
