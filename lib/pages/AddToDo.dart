import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({super.key});

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff1d1e26),
            Color(0xff252041),
          ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                ),
              IconButton(
                onPressed: (){}, 
                icon: Icon(
                  CupertinoIcons.arrow_left,
                  color: Colors.white,
                  size: 28,
                  ),
                ),
                Padding(
                  padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 33,
                            letterSpacing: 4,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "New ToDo",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 33,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        label("Task Title"),
                        SizedBox(
                          height: 30,
                        ),
                        title(),
                        SizedBox(
                          height: 30,
                        ),
                        label("Task Type"),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            chipData("Important",0xff2664ae),
                            SizedBox(
                              width: 20,
                            ),
                            chipData("Planned",0xff2bc89d),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        label("Description"),
                        SizedBox(
                          height: 30,
                        ),
                        description(),
                         SizedBox(
                          height: 30,
                        ),
                        label("Category"),
                        SizedBox(
                          height: 30,
                        ),
                        Wrap(
                          runSpacing: 10,
                          children: [
                            chipData("Food",0xffff6d6e),
                            SizedBox(
                              width: 20,
                            ),
                            chipData("Workout",0xfff29732),
                            SizedBox(
                              width: 20,
                            ),
                            chipData("Work",0xff6557ff),
                            SizedBox(
                              width: 20,
                            ),
                            chipData("Design",0xff234ebd),
                            SizedBox(
                              width: 20,
                            ),
                            chipData("Run",0xff2bc8d9),
                          ],
                        ),
                         SizedBox(
                              height: 50,
                             ),
                            button(),
                             SizedBox(
                              height: 30,
                            ),
                      ],
                   ),
                ),
            ],
          ),
        ),
      ),
    );
  }

Widget button(){
  return Container(
    height: 56,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        colors: [
          Color(0xff8a32f1),
          Color(0xffad32f9),
        ],
        ),
    ),
    child: Center(
      child: Text(
        "Add ToDo",
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
      ),
    ),
  );
}

Widget description(){
  return Container(
    height: 150,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Color(0xff2a2e3d),
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextFormField(
      style: TextStyle(
        color:Colors.grey,
        fontSize: 17,
      ),  
      maxLines: null,  
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Task title",
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
        contentPadding: const EdgeInsets.only(
        left: 20,
        right: 20,
      )
      ),  
    ),
  );
}

Widget chipData(String label, int color){
  return Chip(
        backgroundColor: Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

        label: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        labelPadding: EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 3.8,
        ),
  );
}

Widget title(){
  return Container(
    height: 55,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Color(0xff2a2e3d),
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextFormField(
      style: TextStyle(
        color:Colors.grey,
        fontSize: 17,
      ),    
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Task title",
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
        contentPadding: const EdgeInsets.only(
        left: 20,
        right: 20,
      )
      ),  
    ),
  );
}

  Widget label(String label){
    return Text(
      label,
      style: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      fontSize: 16.5,
      letterSpacing: 0.2,
      ),
    );                  
  }
}