import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_post.freezed.dart';
part 'recent_post.g.dart';

@freezed
class RecentPost with _$RecentPost {
  const factory RecentPost({
    required String title,
    required String authorFullname,
    String? thumbnail,
  }) = _RecentPost;

  factory RecentPost.fromJson(Map<String, dynamic> json) =>
      _$RecentPostFromJson(json);
}
