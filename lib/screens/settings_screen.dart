import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  final ThemeProvider themeProvider;
  const SettingsScreen({Key? key, required this.themeProvider}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<MaterialColor> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.orange,
  ];

  final List<String> names = ["Blue", "Red", "Green", "Purple", "Orange"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Color Picker 🎨"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: colors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final color = colors[index];
            final name = names[index];
            final isSelected = widget.themeProvider.primaryColor == color;

            return GestureDetector(
              onTap: () {
                widget.themeProvider.setPrimaryColor(color);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Theme changed to $name"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                color: color.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: isSelected
                      ? BorderSide(color: Colors.black, width: 3)
                      : BorderSide.none,
                ),
                child: Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
