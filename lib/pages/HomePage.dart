import 'package:flutter/material.dart';
import 'package:todo_app/Service/Auth_Service.dart';
import 'package:todo_app/pages/SignUpPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: () async {
          await authClass.logout();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => SignUpPage()),
              (route) => false);
        })],
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );  }
}