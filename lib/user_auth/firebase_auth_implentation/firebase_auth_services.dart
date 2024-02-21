
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices{

  FirebaseAuth _auth= FirebaseAuth.instance;

  Future<User?> SignupwithEmailandPassword(String Email,String Password)async{
    try{
      UserCredential credential=await _auth.createUserWithEmailAndPassword(email:Email,password: Password );
      return credential.user;

    }catch(e){
      print(e);
    }
  }
  Future<User?>SigninWithEmailAndPassword(String Email,String Password)async{
    try{
      UserCredential credential=await _auth.signInWithEmailAndPassword(email: Email, password: Password);
      return credential.user;

    }catch(e){
      print(e);
    }


  }


}