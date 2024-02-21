import 'package:attandance/user_auth/firebase_auth_implentation/firebase_auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool flag=true;
  FirebaseAuthServices _auth=FirebaseAuthServices();
   TextEditingController Emailcontroller=TextEditingController();
   TextEditingController Passwordcontroller=TextEditingController();
   TextEditingController Namecontroller=TextEditingController();
   @override
   void dispose(){

    Emailcontroller.dispose();
    Passwordcontroller.dispose();
    Namecontroller.dispose();
    super.dispose();


   }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width=MediaQuery.of(context).size.width*1;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Registration Form",style: GoogleFonts.acme(fontSize: 32),),
                          SizedBox(height: height*.02,),

              TextFormField(
                controller: Namecontroller,
                decoration: InputDecoration(
                    label: Text(" Enter Name"),
                   suffix:Icon(Icons.account_box_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(height: height*.02,),
              TextFormField(
                controller: Emailcontroller,
                decoration: InputDecoration(
                  //  icon: Icon(Icons.email_outlined),
                    label: Text("email"),
                    suffix: Icon(Icons.email_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              SizedBox(height: height*.02,),
              TextFormField(
                controller: Passwordcontroller,
                obscureText: flag,
                decoration:InputDecoration(
                  label: Text("Password"),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                         flag=!flag;
                      });

                    },
                    child: flag?Icon(Icons.visibility_off)
                        :Icon(Icons.visibility),
                  ),
                    border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(12),
                  )
                ) ,
              ),
              SizedBox(height: height*.04,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 InkWell(
                   onTap: (){
                     _signup();
                   },
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.deepPurpleAccent,
                       borderRadius: BorderRadius.circular(12),

                     ),
                       width: width*.8,
                     height: height*.07,
                    child: Center(
                        child: Text("Signup",

                          style:TextStyle(
                            fontWeight: FontWeight.bold),
              ))
                   ),
                 )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _signup() async {
       String name=Namecontroller.text;
       String Password=Passwordcontroller.text;
       String Email=Emailcontroller.text;
       User? user   =await _auth.SignupwithEmailandPassword(Email, Password);
       if(user!=null){
         print("User is Successful Login");
       }
       else{
         print("some error is here");
       }
  }
}
