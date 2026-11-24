import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_reservations_app/dashboard_page.dart';

void main() {
  testWidgets('error when guest name is empty', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: DashboardPage()));
    await tester.ensureVisible(find.byKey(const Key('bookNowButton')));
    await tester.tap(find.byKey(const Key('bookNowButton')));
    await tester.pump();

    expect(find.text('Guest name is required'), findsOneWidget);
  });

  testWidgets('no error when guest name is filled', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: DashboardPage()));
    await tester.enterText(find.byKey(const Key('guestName')), 'Aminah');
    await tester.ensureVisible(find.byKey(const Key('bookNowButton')));
    await tester.tap(find.byKey(const Key('bookNowButton')));
    await tester.pump();

    expect(find.text('Guest name is required'), findsNothing);
  });

  testWidgets('error when email is invalid', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: DashboardPage()));
    await tester.enterText(
      find.byKey(const Key('guestEmail')),
      'invalid-email',
    );
    await tester.ensureVisible(find.byKey(const Key('bookNowButton')));
    await tester.tap(find.byKey(const Key('bookNowButton')));
    await tester.pump();

    expect(find.text('Enter a valid email'), findsOneWidget);
  });

  testWidgets('no error when email is valid', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: DashboardPage()));
    await tester.enterText(
      find.byKey(const Key('guestEmail')),
      'aminah@example.com',
    );
    await tester.ensureVisible(find.byKey(const Key('bookNowButton')));
    await tester.tap(find.byKey(const Key('bookNowButton')));
    await tester.pump();

    expect(find.text('Enter a valid email'), findsNothing);
  });

  testWidgets('error when dates are not selected', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: DashboardPage()));
    await tester.enterText(find.byKey(const Key('guestName')), 'Aminah');
    await tester.enterText(
      find.byKey(const Key('guestEmail')),
      'aminah@example.com',
    );
    await tester.ensureVisible(find.byKey(const Key('bookNowButton')));
    await tester.tap(find.byKey(const Key('bookNowButton')));
    await tester.pump();

    expect(
      find.text('Please select check-in and check-out dates'),
      findsOneWidget,
    );
  });
}
