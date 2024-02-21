import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:firebase_database/firebase_database.dart';
class onleave extends StatefulWidget {
  const onleave({super.key});

  @override
  State<onleave> createState() => _onleaveState();
}

class _onleaveState extends State<onleave> {
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Leave Form",style: GoogleFonts.acme(fontSize: 28,color: Colors.red),),
                SizedBox(height: 30),

                TextFormField(decoration:
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
                SizedBox(height: 20),
                TextFormField(decoration:
                InputDecoration(
                    label: Text("Leave Type"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),

                    ),


                )),
                SizedBox(height: 20),
                TextFormField(decoration:
                InputDecoration(
                  label: Text("Duration"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),

                  ),


                )),


                SizedBox(height: 30),


                ElevatedButton(
                    onPressed: (){
                      if(_formkey.currentState!.validate()){
                        print("hello g");
                      }
                    }, child: Text("Submit",style: GoogleFonts.poppins(),))
              ],
            ),
          ),
        ),
      );
  }
}
