import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/api_providers/dio_providers.dart';
import 'package:flutter_riverpod_template/features/home/presentation/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../utils/pump_route.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
  });

  group('HomeScreen', () {
    testWidgets(
      'should be shown when going to the "/" route',
      (tester) async {
        await tester.pumpRoute(
          '/',
          overrides: [baseDioProvider.overrideWithValue(dio)],
        );

        expect(find.byType(HomeScreen), findsOneWidget);
      },
    );

    testWidgets(
      'should display a list of posts',
      (tester) async {
        await mockNetworkImages(() async {
          dioAdapter.onGet(
            '/r/flutterdev.json',
            (request) => request.reply(
              200,
              {
                'kind': 'test',
                'data': {
                  'after': 'test',
                  'dist': 2,
                  'modhash': 'modhash',
                  'children': [
                    {
                      'kind': 'test',
                      'data': {
                        'title': 'Title 1',
                        'author_fullname': 'Author 1',
                        'thumbnail': 'https://via.placeholder.com/150',
                      },
                    },
                    {
                      'kind': 'test',
                      'data': {
                        'title': 'Title 2',
                        'author_fullname': 'Author 2',
                        'thumbnail': 'https://via.placeholder.com/150',
                      },
                    },
                  ],
                },
              },
            ),
          );

          await tester.pumpRoute(
            '/home',
            shouldPumpAndSettle: false,
            overrides: [baseDioProvider.overrideWithValue(dio)],
          );

          expect(find.byType(CircularProgressIndicator), findsOneWidget);

          await tester.pump(const Duration(seconds: 5));

          expect(find.text('Title 1'), findsOneWidget);
          expect(find.text('Author 1'), findsOneWidget);
          expect(find.text('Title 2'), findsOneWidget);
          expect(find.text('Author 2'), findsOneWidget);
        });
      },
    );

    testWidgets(
      'should load the next page when "Next Page" button is tapped',
      (tester) async {
        dioAdapter
          ..onGet(
            '/r/flutterdev.json',
            (request) => request.reply(
              200,
              {
                'kind': 'test',
                'data': {
                  'after': 'test',
                  'dist': 2,
                  'modhash': 'modhash',
                  'children': [
                    {
                      'kind': 'test',
                      'data': {
                        'title': 'Title 1',
                        'author_fullname': 'Author 1',
                      },
                    },
                    {
                      'kind': 'test',
                      'data': {
                        'title': 'Title 2',
                        'author_fullname': 'Author 2',
                      },
                    },
                  ],
                },
              },
            ),
          )
          ..onGet(
            '/r/flutterdev.json',
            (request) => request.reply(
              200,
              {
                'kind': 'test',
                'data': {
                  'after': 'test2',
                  'dist': 2,
                  'modhash': 'modhash',
                  'children': [
                    {
                      'kind': 'test',
                      'data': {
                        'title': 'Title 3',
                        'author_fullname': 'Author 3',
                      },
                    },
                    {
                      'kind': 'test',
                      'data': {
                        'title': 'Title 4',
                        'author_fullname': 'Author 4',
                      },
                    },
                  ],
                },
              },
            ),
            queryParameters: {'after': 'test'},
          );

        await tester.pumpRoute(
          '/home',
          shouldPumpAndSettle: false,
          overrides: [baseDioProvider.overrideWithValue(dio)],
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        await tester.pump(const Duration(seconds: 5));

        expect(find.text('Title 1'), findsOneWidget);
        expect(find.text('Author 1'), findsOneWidget);
        expect(find.text('Title 2'), findsOneWidget);
        expect(find.text('Author 2'), findsOneWidget);

        await tester.pumpAndSettle();
        await tester.tap(find.byType(FloatingActionButton));

        // expect(find.byType(CircularProgressIndicator), findsOneWidget);

        await tester.pumpAndSettle();

        expect(find.text('Title 3'), findsOneWidget);
        expect(find.text('Author 3'), findsOneWidget);
        expect(find.text('Title 4'), findsOneWidget);
        expect(find.text('Author 4'), findsOneWidget);
      },
    );

    testWidgets(
      'should display an error message when any errors occur',
      (tester) async {
        dioAdapter.onGet(
          '/r/flutterdev.json',
          (request) => request.throws(
            500,
            DioException(
              requestOptions: RequestOptions(path: '/r/flutterdev.json'),
              error: Exception('Error message'),
            ),
          ),
        );

        await tester.pumpRoute(
          '/home',
          shouldPumpAndSettle: false,
          overrides: [baseDioProvider.overrideWithValue(dio)],
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        await tester.pumpAndSettle();

        expect(find.textContaining('Error message'), findsOneWidget);
      },
    );
  });
}
