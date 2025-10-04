import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  MaterialColor _primaryColor = Colors.blue;

  ThemeMode get themeMode => _themeMode;
  MaterialColor get primaryColor => _primaryColor;

  ThemeProvider() {
    _loadPreferences();
  }

  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode.toString());
    notifyListeners();
  }

  void setPrimaryColor(MaterialColor color) async {
    _primaryColor = color;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('primaryColor', color.value.toString());
    notifyListeners();
  }

  // 🔹 Load preferences on startup
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    // Load theme mode
    final themeModeStr = prefs.getString('themeMode');
    if (themeModeStr != null) {
      if (themeModeStr.contains('light')) _themeMode = ThemeMode.light;
      if (themeModeStr.contains('dark')) _themeMode = ThemeMode.dark;
      if (themeModeStr.contains('system')) _themeMode = ThemeMode.system;
    }

    // Load primary color
    final colorValue = prefs.getString('primaryColor');
    if (colorValue != null) {
      final colorInt = int.tryParse(colorValue);
      if (colorInt != null) {
        _primaryColor = _colorFromValue(colorInt);
      }
    }

    notifyListeners();
  }

  // 🔹 Helper to match saved color
  MaterialColor _colorFromValue(int value) {
    return {
      Colors.blue.value: Colors.blue,
      Colors.red.value: Colors.red,
      Colors.green.value: Colors.green,
      Colors.purple.value: Colors.purple,
      Colors.orange.value: Colors.orange,
    }[value] ?? Colors.blue;
  }
}
