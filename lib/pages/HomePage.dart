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
            backgroundColor:Color.fromARGB(255, 31, 24, 114),
            title: Text(
              "Today's Schedule",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
        actions: [
          CircleAvatar(
          backgroundImage: AssetImage("assets/6417.jpg"),
          ),
          SizedBox(
            width: 25,
          ),
        ],
        bottom: const PreferredSize(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text(
                "Monday 21",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          preferredSize:Size.fromHeight(35),
        ),
      ),
        bottomNavigationBar:BottomNavigationBar(
        backgroundColor:Color.fromARGB(255, 31, 24, 114),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home, 
              size: 28,
              color: Colors.white,
            ),
            label: '',          
            ),
           BottomNavigationBarItem(
            icon: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.indigoAccent,
                    Colors.purple,
                   ]
                  ),
              ),
              child: Icon(
              Icons.add,
              size: 32,
              color: Colors.white,
              ),
            ),
            label: '',          
            ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 28,
              color: Colors.white,
            ),
            label: '',          
            ),
        ],
        ),
    );  
  }
}

//for future use

// [IconButton(icon: Icon(Icons.logout), onPressed: () async {
//           await authClass.signOut();
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (builder) => SignUpPage()),
//               (route) => false);
//         })