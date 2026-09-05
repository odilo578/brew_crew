import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
   new({super.key});
  
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
     String email = '';
 String password = '';
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
      title: Text('Sign up to Brew Crew'),
      backgroundColor: Colors.brown.shade400,
    ),

    body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20,),
        
                TextFormField(
                  validator:(val)=> (val == null || val.isEmpty) ? 'Enter an email' : null,
                  onChanged: (val){
                    setState(()=> email = val);
                  },
                ),
                SizedBox(height: 20,),
        
                TextFormField(
                  validator:(val)=> (val == null || val.length < 6) ? 'Enter a password 6+ char long' : null,
                  obscureText: true,
                  onChanged: (val){
                     setState(()=> password = val);
                  },
                ),
                SizedBox(height: 30.0,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                  if(_formKey.currentState?.validate()?? false){
                    print(email);
                    print(password);
                  }
                  }, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink
                  ), child: Text('Sign Up', style: TextStyle(color: Colors.white),)),),

                  SizedBox(height: 30.0,),
                  Text('If you already have an accout:'),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                 
                  }, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade200
                  ), child: Text('Login', style: TextStyle(color: Colors.white),)))
              ],
            ),
           ),
        ),
      ));
  }
}