import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';

// 🔹 Import all task screens
import 'layout_demo_screen.dart';
import 'user_list_screen.dart';
import 'bottom_nav_main.dart';
import 'drawer_menu.dart';
import 'settings_screen.dart';
import 'product_gallery_screen.dart';
import 'register_screen.dart';
import 'dashboard_screen.dart';
import 'advanced_layout_screen.dart';

class HomeScreen extends StatelessWidget {
  final ThemeProvider themeProvider;

  const HomeScreen({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme & Layout Lab'),
        centerTitle: true,
        actions: [
          // 🔹 Theme switcher in popup menu
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.brightness_6),
            onSelected: (ThemeMode mode) {
              themeProvider.setThemeMode(mode);
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: ThemeMode.light,
                child: Text('Light Mode'),
              ),
              const PopupMenuItem(
                value: ThemeMode.dark,
                child: Text('Dark Mode'),
              ),
              const PopupMenuItem(
                value: ThemeMode.system,
                child: Text('System Default'),
              ),
            ],
          ),
        ],
      ),

      // 🔹 Body Section with all Task Buttons
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Welcome to Flutter Lab!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),

            // Task 1 — Theme Picker
            ElevatedButton.icon(
              icon: const Icon(Icons.color_lens),
              label: const Text("🎨 Theme Color Picker"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SettingsScreen(themeProvider: themeProvider),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            // Task 2 — Layout Demo
            ElevatedButton.icon(
              icon: const Icon(Icons.view_comfy),
              label: const Text("🧱 Layout Alignment Demo"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LayoutDemoScreen()),
                );
              },
            ),
            const SizedBox(height: 12),

            // Task 3 — User List & Data Passing
            ElevatedButton.icon(
              icon: const Icon(Icons.people),
              label: const Text("👥 User List + Detail Navigation"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserListScreen()),
                );
              },
            ),
            const SizedBox(height: 12),

            // Task 4 — Drawer Menu
            ElevatedButton.icon(
              icon: const Icon(Icons.menu),
              label: const Text("📂 Drawer Navigation Menu"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DrawerMenu(themeProvider: themeProvider),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            // Task 5 — Bottom Navigation
            ElevatedButton.icon(
              icon: const Icon(Icons.dashboard),
              label: const Text("🚀 Bottom Navigation Bar"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavMain()),
                );
              },
            ),
            const SizedBox(height: 12),

            // Task 6 — Product Grid Gallery
            ElevatedButton.icon(
              icon: const Icon(Icons.shopping_bag),
              label: const Text("🧩 Product Grid Gallery"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductGalleryScreen()),
                );
              },
            ),
            const SizedBox(height: 12),

            // Task 7 — Registration Form
            ElevatedButton.icon(
              icon: const Icon(Icons.app_registration),
              label: const Text("📝 Registration Form"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                );
              },
            ),
            const SizedBox(height: 12),

            // Task 8 — Dashboard
            ElevatedButton.icon(
              icon: const Icon(Icons.dashboard_customize),
              label: const Text("📊 Dashboard Cards + Hero"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
                );
              },
            ),
            const SizedBox(height: 12),

            // Task 9 — Advanced Layouts
            ElevatedButton.icon(
              icon: const Icon(Icons.view_quilt),
              label: const Text("🧠 Advanced Layout Combinations"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdvancedLayoutScreen()),
                );
              },
            ),
            const SizedBox(height: 24),

            const Divider(),
            Text(
              "📘 All Tasks Completed!",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      // 🔹 Floating Action Button Shortcut (to Layout Demo)
      floatingActionButton: FloatingActionButton(
        tooltip: "Quick Layout Demo",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LayoutDemoScreen()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
