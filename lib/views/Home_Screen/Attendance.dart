import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentAttandace extends StatefulWidget {
  const StudentAttandace({super.key});

  @override
  State<StudentAttandace> createState() => _StudentAttandaceState();
}

class _StudentAttandaceState extends State<StudentAttandace> {
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  TextEditingController namecontroller=TextEditingController();
  TextEditingController idcontroller=TextEditingController();

  final databaseref=FirebaseDatabase .instance.ref("Post");
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          TextFormField(
              controller: namecontroller,
              decoration:
          InputDecoration(
              label: Text("Student Name"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),

            )

          )),
            SizedBox(height: 20),
            Form(
              key: _formkey,
              child: TextFormField(
                controller: idcontroller,
                validator: (value){
                  if(value!.isEmpty||value==null){
                    return "Enter Student ID";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  label: Text("Student ID"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),

                  )

              )),
            ),
            ElevatedButton(
                onPressed: (){
                  if(_formkey.currentState!.validate()){
                databaseref.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
                 "id":DateTime.now().microsecondsSinceEpoch.toString(),
                  "Name":namecontroller.text.toString(),
                  "studentid":idcontroller.text.toString(),

                }).then((value){

                }).onError((error, stackTrace){
                  print(error);

                });
                print("hello g");
              }
            }, child: Text("Submit",style: GoogleFonts.poppins(),))
          ],
              ),
        ),
      );
  }
}
