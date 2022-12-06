import 'package:flutter_application_8/presentation/screens/myWelcomePage.dart';
import 'package:flutter_application_8/widgets/app_router.dart';

import 'presentation/screens/myHomePage.dart';
import 'package:flutter/material.dart';
AppRouter appRouter= AppRouter();
void main() {
 runApp(const MyApp());
}
class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);
 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
  initialRoute: '/',
 onGenerateRoute: appRouter.generateRoute, 

 debugShowCheckedModeBanner: false,
 title: 'Flutter Demo',
 theme: ThemeData(
 primarySwatch: Colors.teal,
 ),
home: const MyWelcomePage(), 
 );
 }
} 