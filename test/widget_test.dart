// Basic smoke tests for ALU Pulse.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alu_pulse/main.dart';
import 'package:alu_pulse/pages/sign_up_page.dart';

void main() {
  testWidgets('App opens on the Sign In screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ALUPulseApp());

    // The sign-in screen shows the welcome text and a Sign In button.
    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });

  testWidgets('Can navigate from Sign In to Sign Up', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ALUPulseApp());

    // Tap the "Sign Up" link at the bottom of the sign-in screen.
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // The sign-up screen and its degree options are now visible.
    expect(find.text('Create account'), findsOneWidget);
    expect(find.text('BSE'), findsOneWidget);
    expect(find.text('BEL'), findsOneWidget);
    expect(find.text('BIT'), findsOneWidget);
  });

  testWidgets('Sign Up requires a degree to be chosen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SignUpPage()));

    // Fill in valid name, email and password.
    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Aline Umuhoza');
    await tester.enterText(fields.at(1), 'k.aline@alustudent.com');
    await tester.enterText(fields.at(2), 'password123');

    // Tap "Create Account" without selecting a degree
    // (scroll it into view first, since the form is taller than the test screen).
    await tester.ensureVisible(find.text('Create Account'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Create Account'));
    await tester.pump();

    expect(find.text('Please choose your degree program'), findsOneWidget);
  });
}
