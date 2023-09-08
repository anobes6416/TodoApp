import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:todo_app/Service/Auth_Service.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  int start = 30;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificatioinId = "";
  String smsCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 8, 86),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 8, 86),
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              textField(),
               SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 34,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    Text(
                      "Enter 5 digit OTP",
                      style: TextStyle(color: Colors.white),
                    ),
                     Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 30,
              ),
              otpField(),
               SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Send OTP again in ",
                      style: TextStyle(color: Colors.yellowAccent, fontSize: 16)
                    ),
                    TextSpan(
                      text: "00:$start",
                      style: TextStyle(color: Colors.pinkAccent, fontSize: 16)
                    ),
                    TextSpan(
                      text: " sec",
                      style: TextStyle(color: Colors.yellowAccent, fontSize: 16)
                    ),
                  ],
                ),
                ),
                SizedBox(
                  height: 150,
                ),
                InkWell(
                  onTap: (){
                    authClass.signInwithPhoneNumber(verificatioinId, smsCode, context);
                  },
                child : Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                    color: Color(0xffff9601), 
                    borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Let's Go",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

void startTimer() {
  const onsec = Duration(seconds: 1);
  Timer timer = Timer.periodic(onsec, (timer) {
    if(start == 0){
      setState(() {
        timer.cancel();
        wait = false;
      });
    } else{
      setState(() {
        start -- ;
      });
    }
  });
}

Widget otpField() {
     return OTPTextField(
      length: 5,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 58, 
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Color.fromARGB(255, 10, 34, 120),
        borderColor: Colors.white
      ),
      style: TextStyle(fontSize: 17, color: Colors.white),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  Widget textField() {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 10, 34, 120), 
        borderRadius: BorderRadius.circular(15)
        ),
        child: TextFormField(
          controller: phoneController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your phone Number",
            hintStyle: TextStyle(color: Colors.white,fontSize: 17),
            contentPadding: 
              const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
              child: Text(
                "(+251)",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              ),
          suffixIcon: InkWell(
            onTap: wait
            ? null :() async {
              setState(() {
                start = 30;
                wait = true;
                buttonName = "Resend";
              });
              await authClass.verifyPhoneNumber(
                "+251 ${phoneController.text}", context, setData);
            },
            child : Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                buttonName,
                style: TextStyle(
                  color: wait? Colors.grey : Colors.white, 
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  ),
              ),
              ),
          ),
          ),
        ),
    );
  }
  
  void setData(verificatioinId){
    setState(() {
      verificatioinId = verificatioinId;
    });
    startTimer();
  }
}
