import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
 const MyDrawer({Key? key}) : super(key: key);
 @override
 Widget build(BuildContext context) {
 return Drawer(
 child : ListView(
 // Important: Remove any padding from the ListView.
 padding: EdgeInsets.zero,
 children: [
 const DrawerHeader(
 decoration: BoxDecoration(
 color:Colors.teal,
 ),
 child: UserAccountsDrawerHeader(
 decoration: BoxDecoration(color: Colors.pink),
 accountName: Text(
 "Ghazi",
 style: TextStyle(fontSize: 18),
 ),
 accountEmail: Text("kriaaghazi73@gmail.com"),
 currentAccountPictureSize: Size.square(50),
 currentAccountPicture: CircleAvatar(
 backgroundColor: Colors.teal,
 child: Text(
 "G",
 style: TextStyle(fontSize: 30.0, color: Colors.white),
 ), //Text
 ), //circleAvatar
 ), //UserAccountDrawerHeader
 ),
 ListTile(
 leading: const Icon(Icons.home,color: Colors.teal),
 title : const Text ('Home',style : TextStyle(fontSize: 18,)),
 onTap:(){
  Navigator.pushNamed( context, '/'); 
 },
 ),
 ListTile(
 leading: const Icon(Icons.person,color: Colors.teal),
 title : const Text ('Profile',style : TextStyle(fontSize: 18,)),
 onTap:(){
  Navigator.pushNamed( context, '/listusers'); 

 },
 ),
 ListTile(
 leading: const Icon(Icons.list,color: Colors.teal),
 title : const Text ('List',style : TextStyle(fontSize: 18,)),
 onTap:(){
 },
 ),
 ListTile(
 leading: const Icon(Icons.logout,color: Colors.teal),
 title : const Text ('LogOut',style : TextStyle(fontSize: 18,)),
 onTap:(){
 },
 ),
 ],
 ),
 );
 }
}