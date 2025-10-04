import 'package:flutter/material.dart';

class AdvancedLayoutScreen extends StatelessWidget {
  const AdvancedLayoutScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget coloredBox(String text, Color color) {
    return Container(
      width: 80,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advanced Layouts 🧠"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Section 1
            buildSectionTitle("Section 1: Row (spaceBetween)"),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  coloredBox("A", Colors.blue),
                  coloredBox("B", Colors.blueAccent),
                  coloredBox("C", Colors.lightBlue),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Section 2
            buildSectionTitle("Section 2: Column (spaceAround)"),
            Container(
              padding: const EdgeInsets.all(8),
              height: 250,
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  coloredBox("1", Colors.green),
                  coloredBox("2", Colors.teal),
                  coloredBox("3", Colors.lightGreen),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Section 3
            buildSectionTitle("Section 3: Nested Row & Column"),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      coloredBox("R1", Colors.orange),
                      coloredBox("R2", Colors.deepOrange),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      coloredBox("R3", Colors.amber),
                      coloredBox("R4", Colors.orangeAccent),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Section 4
            buildSectionTitle("Section 4: Stack with Positioned"),
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  // Base container
                  coloredBox("Base", Colors.purple),

                  // Positioned Top Left
                  Positioned(
                    top: 20,
                    left: 30,
                    child: coloredBox("TL", Colors.deepPurple),
                  ),

                  // Positioned Bottom Right
                  Positioned(
                    bottom: 20,
                    right: 30,
                    child: coloredBox("BR", Colors.purpleAccent),
                  ),

                  // Positioned Center
                  Positioned(
                    top: 80,
                    left: 100,
                    child: coloredBox("C", Colors.indigo),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "🎯 Layout Demonstration Completed",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
