import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/app/app.dart';

void main() {
  runZonedGuarded(
    () async {
      // Add your initialization code here (e.g. Firebase, local storage, etc.)

      runApp(const ProviderScope(child: App()));
    },
    (error, stack) {
      // Add your error handling code here (e.g. Sentry, Firebase Crashlytics, etc.)
    },
  );
}
