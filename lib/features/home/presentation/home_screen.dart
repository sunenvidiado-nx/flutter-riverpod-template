import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/home/application/recent_posts_provider.dart';
import 'package:flutter_riverpod_template/features/home/domain/recent_post.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recentPostsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('r/FlutterDev'),
      ),
      body: state.when(
        data: (posts) => ListView.separated(
          itemCount: posts.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final post = posts[index];
            return _buildListItem(post.data);
          },
        ),
        error: (error, stackTrace) => Center(
          child: Text('$error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  Widget _buildListItem(RecentPost post) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('by ${post.authorFullname}'),
          _buildThumbnail(post.thumbnail),
        ],
      ),
    );
  }

  Widget _buildThumbnail(String? url) {
    if (url == null || !Uri.parse(url).isAbsolute) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        height: 100,
        width: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
