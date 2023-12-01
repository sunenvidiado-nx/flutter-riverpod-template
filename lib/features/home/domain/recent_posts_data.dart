import 'package:flutter_riverpod_template/features/home/domain/recent_posts_child.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_posts_data.freezed.dart';
part 'recent_posts_data.g.dart';

@freezed
class RecentPostsData with _$RecentPostsData {
  const factory RecentPostsData({
    required String after,
    String? before,
    required int dist,
    required String modhash,
    required List<RecentPostsChild> children,
  }) = _RecentPostsData;

  factory RecentPostsData.fromJson(Map<String, dynamic> json) =>
      _$RecentPostsDataFromJson(json);
}
