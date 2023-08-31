import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
    firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
    TextEditingController _emailController = TextEditingController();
    TextEditingController _pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 17, 3, 61),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SignUp',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buttonItem("assets/google.svg","continue with google",25),
               SizedBox(
                height: 15,
              ),
              buttonItem("assets/phone.svg","continue with phone",30),
              SizedBox(
                height: 15,
              ),
              Text(
                'OR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
              SizedBox(
                height: 15,
              ),
              textItem("Email", _emailController),
              SizedBox(
                height: 15,
              ),
              textItem("Password", _pwdController),
              SizedBox(
                height: 30,
              ),
              colorButton(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "if you have an account already ? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget colorButton(){
    return InkWell(
      onTap: () {},
      child : Container(
       width: MediaQuery.of(context).size.width-100,
       height: 60, 
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          Color(0xfffd746c),
          Color(0xffff9068),
          Color(0xfffd746c),
        ]),
       ),
      child: Center(
        child: Text(
          "SignUp",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
     ),
    );
  } 
  Widget buttonItem(String imagepath, String buttonname, double size)
  {
     return Container(
                width: MediaQuery.of(context).size.width-60,
                height: 60,
                child: Card(
                  color: Color.fromARGB(255, 17, 3, 61),
                   elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        imagepath,
                        height: size,
                        width: size,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        buttonname,
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                          ),
                       ),
                    ],
                  ),
                ),
              );
   }

    Widget textItem(String labelText, TextEditingController controller){
      return Container(
         width: MediaQuery.of(context).size.width-70,
         height: 55,
         child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
           focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.amber,
                    ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
          ),
          ),
         ),
      );
    }
}