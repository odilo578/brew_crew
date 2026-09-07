import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Home extends StatelessWidget {

 
   new({super.key});
 final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: Database(uid: '').brews, 
      initialData: null,
      
      child: Scaffold(
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
              Get.off(()=>SignIn());
            }, icon: Icon(Icons.person)),
          ],
        ),

        body: BrewList(),
        
      ),
    );
  }
}