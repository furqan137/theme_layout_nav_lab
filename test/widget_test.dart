import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:theme_layout_nav_lab/main.dart';

void main() {
  testWidgets('App builds and shows all main buttons', (WidgetTester tester) async {
    // 🧱 Build the main app
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // ✅ Check main screen content
    expect(find.text('Welcome to Flutter Lab!'), findsOneWidget);
    expect(find.text('Theme & Layout Lab'), findsOneWidget);

    // ✅ Check theme switcher icon
    expect(find.byIcon(Icons.brightness_6), findsOneWidget);

    // 🔹 Open the popup menu
    await tester.tap(find.byIcon(Icons.brightness_6));
    await tester.pumpAndSettle();

    // ✅ Verify popup menu options
    expect(find.text('Light Mode'), findsOneWidget);
    expect(find.text('Dark Mode'), findsOneWidget);
    expect(find.text('System Default'), findsOneWidget);

    // ✅ Check for main task buttons
    expect(find.text("🎨 Theme Color Picker"), findsOneWidget);
    expect(find.text("🧱 Layout Alignment Demo"), findsOneWidget);
    expect(find.text("👥 User List + Detail Navigation"), findsOneWidget);
    expect(find.text("📂 Drawer Navigation Menu"), findsOneWidget);
    expect(find.text("🚀 Bottom Navigation Bar"), findsOneWidget);
    expect(find.text("🧩 Product Grid Gallery"), findsOneWidget);
    expect(find.text("📝 Registration Form"), findsOneWidget);
    expect(find.text("📊 Dashboard Cards + Hero"), findsOneWidget);
    expect(find.text("🧠 Advanced Layout Combinations"), findsOneWidget);

    // ✅ Scroll to make sure all buttons are visible (in case screen is small)
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -500));
    await tester.pumpAndSettle();

    // ✅ Tap on one button to verify navigation works
    await tester.tap(find.text("🧱 Layout Alignment Demo"));
    await tester.pumpAndSettle();

    // ✅ Check if Layout Demo Screen is displayed
    expect(find.text('Layout Alignment Demo'), findsOneWidget);

    // ✅ Go back to home screen
    await tester.pageBack();
    await tester.pumpAndSettle();

    // ✅ Check home screen is visible again
    expect(find.text('Welcome to Flutter Lab!'), findsOneWidget);
  });
}
