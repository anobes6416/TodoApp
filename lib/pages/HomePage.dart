import 'package:flutter/material.dart';
import 'package:todo_app/Service/Auth_Service.dart';
import 'package:todo_app/pages/SignUpPage.dart';
import 'package:todo_app/main.dart';

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
    backgroundColor:Color.fromARGB(255, 14, 8, 86),
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: () async {
          await authClass.signOut();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => SignUpPage()),
              (route) => false);
        })],
      ),
      
    );  }
}