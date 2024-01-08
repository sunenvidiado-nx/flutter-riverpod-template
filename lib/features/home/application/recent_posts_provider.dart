import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/home/data/reddit_posts_api.dart';

final recentPostsProvider = FutureProvider.autoDispose(
  (ref) async {
    final api = ref.read(redditPostsApiProvider);
    return api.getRecentPosts().then((r) => r.data.children);
  },
);
