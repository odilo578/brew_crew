import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

// this is a final property that gets us in firebase auth instace, we use _ because we want the property to be private, which means that it can be accessed only in that file. 
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //this is where we are going to define all of the different methods that will interact with firebase for us. 

  //sign in anon
Future signInAnon() async{
  try{
    UserCredential result = await _auth.signInAnonymously(); 
    User? user = result.user;
    return user;
  } catch(e){
    print(e.toString());
    return null;
  }
}



  //sign in with email and password



  //register with email and password




  // sign out



}