// 5. SupportScreen.dart
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Support & Help")),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("FAQs"),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact Us"),
          ),
          ListTile(
            leading: Icon(Icons.report_problem),
            title: Text("Report an Issue"),
          ),
        ],
      ),
    );
  }
}
