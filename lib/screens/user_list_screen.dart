import 'package:flutter/material.dart';
import 'user_detail_screen.dart';

// 🔹 Model Class for User
class User {
  final String name;
  final String email;
  final int age;

  User({required this.name, required this.email, required this.age});
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🔹 Sample User Data
    final List<User> users = [
      User(name: "Alice Johnson", email: "alice@example.com", age: 25),
      User(name: "Bob Smith", email: "bob@example.com", age: 30),
      User(name: "Charlie Brown", email: "charlie@example.com", age: 28),
      User(name: "Diana Prince", email: "diana@example.com", age: 27),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(user.name[0]),
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // 🔹 Navigate to detail screen with user data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailScreen(user: user),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
