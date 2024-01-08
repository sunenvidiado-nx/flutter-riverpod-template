// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/features/app/app.dart';

void main() {
  // Place your initializers here

  runApp(
    const ProviderScope(child: App()),
  );
}
