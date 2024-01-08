import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/home/data/get_recent_posts_use_case.dart';

final recentPostsProvider = FutureProvider.autoDispose(
  (ref) async {
    final useCase = ref.read(getRecentPostsUseCaseProvider);
    return useCase.run().then((r) => r.data.children);
  },
);
