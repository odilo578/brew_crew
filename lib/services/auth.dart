import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

// TODO NOTE: FirebaseUser is now User and AuthResult is now UserCredential.
// this is a final property that gets us in firebase auth instace, we use _ because we want the property to be private, which means that it can be accessed only in that file. 
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebase user:

  MyUser? _userFromFirebaseUser(User?user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<MyUser?> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);//map((User? user) => _userFromFirebaseUser(user));
  }
  //this is where we are going to define all of the different methods that will interact with firebase for us. 

  //sign in anon
Future signInAnon() async{
  try{
    UserCredential result = await _auth.signInAnonymously(); 
    User? user = result.user;
    return _userFromFirebaseUser(user);
  } catch(e){
    print(e.toString());
    return null;
  }
}




  //sign in with email and password



  //register with email and password




  // sign out
Future logOut() async{
  try{
   return await _auth.signOut();
  } catch(e){
    print(e.toString());
    return null;
  }
}



}