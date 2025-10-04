import 'package:flutter/material.dart';
import 'dashboard_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🔹 Dashboard Items
    final List<Map<String, dynamic>> items = [
      {"title": "Sales", "icon": Icons.show_chart, "color": Colors.blue},
      {"title": "Inventory", "icon": Icons.inventory_2, "color": Colors.green},
      {"title": "Customers", "icon": Icons.people, "color": Colors.orange},
      {"title": "Reports", "icon": Icons.receipt_long, "color": Colors.purple},
      {"title": "Settings", "icon": Icons.settings, "color": Colors.teal},
      {"title": "Analytics", "icon": Icons.analytics, "color": Colors.red},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard 📊"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: items.map((item) {
            return Hero(
              tag: item["title"],
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardDetailScreen(
                        title: item["title"],
                        color: item["color"],
                        icon: item["icon"],
                      ),
                    ),
                  );
                },
                child: Card(
                  color: item["color"].withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item["icon"], size: 50, color: Colors.white),
                      const SizedBox(height: 12),
                      Text(
                        item["title"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
