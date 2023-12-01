import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/home/presentation/home_screen.dart';
import 'package:go_router/go_router.dart';

final initialRouteProvider = Provider((_) => '/');

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: ref.watch(initialRouteProvider),
    observers: [
      // TODO: Add observers
    ],
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => '/home',
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
});
