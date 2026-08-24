import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const new({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ElevatedButton(onPressed: () async{
          dynamic result = await _auth.signInAnon();
          if(result == null){
            print('error signing in');
          } else{
            print('signed in');
            print(result);
          }
        }, child: Text('Sign in anon')) ,
      ),
    );
  }
}