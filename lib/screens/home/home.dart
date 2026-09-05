import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

 
   new({super.key});
 final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        title: Text('Brew Crew', ),
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        actions: [
          Text('logout', style: TextStyle(
            fontSize: 12, 
          ),),
          IconButton(onPressed: () async{
            await _auth.logOut();
          }, icon: Icon(Icons.person)),
        ],
      ),
      
    );
  }
}