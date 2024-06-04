import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/app/app.dart';
import 'package:flutter_riverpod_template/features/app/router.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpRouteX on WidgetTester {
  /// Pumps the [App] and navigates to the given [route].
  ///
  /// Optionally, you can override providers using [overrides].
  ///
  /// You can also use a different [ProviderContainer] if you want to.
  ///
  /// If [shouldPumpAndSettle] is true (default), it will call [pumpAndSettle].
  Future<void> pumpRoute(
    String route, {
    List<Override> overrides = const [],
    bool shouldPumpAndSettle = true,
  }) async {
    await pumpWidget(
      ProviderScope(
        overrides: [
          ...overrides,
          initialRouteProvider.overrideWithValue(route),
        ],
        child: const App(),
      ),
    );

    if (shouldPumpAndSettle) await pumpAndSettle();
  }
}
