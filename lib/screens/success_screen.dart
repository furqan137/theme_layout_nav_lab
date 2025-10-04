import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String country;

  const SuccessScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Successful ✅"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(Icons.check_circle, color: Colors.green, size: 80),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Welcome, $name!",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text("📧 Email: $email"),
                Text("📞 Phone: $phone"),
                Text("🚻 Gender: $gender"),
                Text("🌍 Country: $country"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
