import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


class BrewList extends StatefulWidget {
  const new({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<QuerySnapshot>(context);
   // print(brews);
   for(var document in brews.docs){
    print(document.data);
   }
    return const Placeholder();
  }
}