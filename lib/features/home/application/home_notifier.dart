import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/home/data/flutter_dev_api.dart';
import 'package:flutter_riverpod_template/features/home/domain/recent_posts_child.dart';

class HomeNotifier extends AsyncNotifier<List<RecentPostsChild>> {
  late String _after;

  @override
  FutureOr<List<RecentPostsChild>> build() async {
    final response = await ref.read(flutterDevApiProvider).getRecentPosts();
    _after = response.data.after;
    return response.data.children;
  }

  Future<void> loadNextPage() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response =
          await ref.read(flutterDevApiProvider).getRecentPosts(after: _after);

      _after = response.data.after;

      return response.data.children;
    });
  }
}

final homeNotifierProvider =
    AsyncNotifierProvider<HomeNotifier, List<RecentPostsChild>>(
  HomeNotifier.new,
);
