import 'package:flutter/material.dart';

import '/widgets/mydrawer.dart'; 

import '/widgets/searchZone.dart';
import '/widgets/userList.dart';
class MyHomePage extends StatelessWidget {
 const MyHomePage({Key? key}) : super(key: key);
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: const Text('Users'),
 ),
 body: Container(
 padding: const EdgeInsets.all(10),
 color: Colors.white,
 child: Column(
 children: const [
 SearchZone(),
 Divider(
 color: Colors.black,
 ), 

 Expanded( child : UserList()),

 ],
 ),
 ),
 drawer: const MyDrawer(),
 );
 }
} 
