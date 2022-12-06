import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/cubit/cubit/search_cubit.dart';
import '../business_logic/cubit/user_cubit.dart';
import '../data/repository/users_repository.dart';
import '../data/web_services.dart/user_services.dart';
import '../presentation/screens/myHomePage.dart';
import '../presentation/screens/myWelcomePage.dart';
class AppRouter{
 UserRepository? userRepository;
 UserCubit? userCubit;
 AppRouter() {
 userRepository = UserRepository (UserServices());
 userCubit = UserCubit(userRepository!);
 }
 Route? generateRoute(RouteSettings settings) {
 switch (settings.name){
 case '/':
 return MaterialPageRoute(builder:(_)=>const MyWelcomePage());
 /*case '/listusers':
 return MaterialPageRoute(
 //Ainsi, créer et fournir notre Cubit signifie que chaque widget en dessous aura accès au Cubit.
  builder: (_) => BlocProvider(
 //La méthode create créé le cubit et le rend accessible dans le contexte
 create: (context) => UserCubit(userRepository!),
 child: const MyHomePage(),
 ),
 );*/

 case '/listusers':
 return MaterialPageRoute(
 //Ainsi, créer et fournir notre Cubit signifie que chaque widget en dessous aura accès au Cubit.
 builder: (_) =>
 MultiBlocProvider(
 providers: [
 BlocProvider<UserCubit>(
 create: (BuildContext context) => UserCubit(userRepository!),
 ),
 BlocProvider<SearchCubit>(
 create: (BuildContext context) => SearchCubit(),
 ),

 ],
 child: const MyHomePage(),
)
 ); 
 }
 return null;
 }

} 