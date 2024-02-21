import 'dart:async';

import 'package:attandance/user_auth/firebase_auth_implentation/firebase_auth_services.dart';
import 'package:attandance/views/Home_Screen/Home_Screen.dart';
import 'package:attandance/views/Signup_Screen/SignUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  final _formkey=GlobalKey<FormState>();

  FirebaseAuthServices _services=FirebaseAuthServices();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  @override
  void dispose(){
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height*1;
    var width=MediaQuery.of(context).size.width*1;


    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Signin",style: GoogleFonts.acme(fontSize: 32),),
            SizedBox(height: height*.02,),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add additional email format validation here if needed
                      return null;
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email_outlined),
                      label: Text("Enter Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: height*.02,),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      // Add additional password format validation here if needed
                      return null;
                    },
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.password),
                      label: Text("Enter Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height*.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                  },
                  child: Text("Sign up", style: GoogleFonts.poppins()),
                ),
                GestureDetector(
                  onTap:(){
                    if (_formkey.currentState!.validate()) {
                      _signIn();

                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.deepPurpleAccent,
                    ),
                    height: height*.05,
                    width: width*.3,
                    child: Center(child: Text("Login",style: GoogleFonts.poppins(),)),
                  ),
                )
              ],
            ),
          ],

        ),
      ),
    );
  }

  Future<void> _signIn() async {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    try {
      User? user = await _services.SigninWithEmailAndPassword(email, password);
      if (user != null) {
        print("User Login Successful");
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print("Login Error");
        // Show error message to the user
      }
    } catch (e) {
      print(e);
      // Show error message to the user
    }
  }
}
