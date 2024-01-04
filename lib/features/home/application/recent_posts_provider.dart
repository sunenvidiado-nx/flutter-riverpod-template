import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/home/data/flutter_dev_api.dart';

final recentPostsProvider = FutureProvider.autoDispose(
  (ref) async {
    return ref
        .read(flutterDevApiProvider)
        .getRecentPosts()
        .then((r) => r.data.children);
  },
);
