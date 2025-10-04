import 'package:flutter/material.dart';
import 'themes/app_theme.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeProvider _themeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();

    // 🔹 Listen for any theme or color changes
    _themeProvider.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme & Layout Lab',
      debugShowCheckedModeBanner: false,

      // 🔹 Apply Light & Dark Themes with dynamic primary color
      theme: AppTheme.lightTheme(_themeProvider.primaryColor),
      darkTheme: AppTheme.darkTheme(_themeProvider.primaryColor),

      // 🔹 Set Theme Mode (Light, Dark, System)
      themeMode: _themeProvider.themeMode,

      // 🔹 Home Screen with Theme Provider
      home: HomeScreen(themeProvider: _themeProvider),
    );
  }
}
