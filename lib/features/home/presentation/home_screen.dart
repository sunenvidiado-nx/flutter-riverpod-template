import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/home/application/home_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('r/FlutterDev'),
      ),
      body: state.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index].data;
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title),
                    Text(
                      item.authorFullname,
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
                subtitle: _buildThumbnail(item.thumbnail),
              );
            },
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text('$error'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(homeNotifierProvider.notifier).loadNextPage();
        },
        label: const Text('Next Page'),
      ),
    );
  }

  Widget _buildThumbnail(String? url) {
    if (url == null || !Uri.parse(url).isAbsolute) {
      return const SizedBox.shrink();
    }

    return Image.network(
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
    );
  }
}
