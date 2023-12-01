import 'package:flutter_riverpod_template/features/home/domain/recent_post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_posts_child.freezed.dart';
part 'recent_posts_child.g.dart';

@freezed
class RecentPostsChild with _$RecentPostsChild {
  const factory RecentPostsChild(String kind, RecentPost data) =
      _RecentPostsChild;

  factory RecentPostsChild.fromJson(Map<String, dynamic> json) =>
      _$RecentPostsChildFromJson(json);
}
