import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Register extends StatefulWidget {
   const Register({super.key});
  
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
     
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
 String password = '';
 String error = '';
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
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
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator:(val)=> (val == null || val.isEmpty) ? 'Enter an email' : null,
                  onChanged: (val){
                    setState(()=> email = val);
                  },
                ),
                SizedBox(height: 20,),
        
                TextFormField(
                 decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator:(val)=> (val == null || val.length < 6) ? 'Enter a password 6+ char long' : null,
                  obscureText: true,
                  onChanged: (val){
                     setState(()=> password = val);
                  },
                ),
                SizedBox(height: 30.0,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()async {
                  if(_formKey.currentState?.validate()?? false){
                    setState(() {
                      loading = true;
                    });
                 dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                 if(result == null){
                  setState(() {
                    error = 'please supply a valid email';
                    loading = false;
                  });
                 }else{
                Get.snackbar('Success', 'Account created successfully!',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
                );
                  Get.to(()=> Home());

                 }
                  }
                  }, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink
                  ), child: Text('Sign Up', style: TextStyle(color: Colors.white),)),),

                  SizedBox(height: 30.0,),
                  Text('If you already have an accout:'),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                 Get.off(()=> SignIn());
                  }, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade200
                  ), child: Text('Login', style: TextStyle(color: Colors.white),))),

                  SizedBox(height: 12.0,),
                  Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0),)
              ],
            ),
           ),
        ),
      ));
  }
}