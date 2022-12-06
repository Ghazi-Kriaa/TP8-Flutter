import 'package:flutter/material.dart';
import 'package:flutter_application_8/widgets/mydrawer.dart'; 
class MyWelcomePage extends StatelessWidget {
 const MyWelcomePage({Key? key}) : super(key: key);
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 backgroundColor: const Color.fromARGB(255, 239, 247, 248),
 appBar: AppBar(
 title: const Text('Welcome'),
 ),
 body: Center(
 child :
Image.network("https://www.amesauvage.com/img/cms/tableau%20tropical.jpg",
 alignment: Alignment.center,
 height: double.infinity,
 width: double.infinity,
 fit: BoxFit.fill,),
 ),
 drawer: const MyDrawer(),
 );
 }
} 