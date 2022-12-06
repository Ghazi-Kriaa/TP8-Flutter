import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/user_cubit.dart';
import '../../data/models/modelUser.dart';
import '../business_logic/cubit/cubit/search_cubit.dart';
class UserList extends StatefulWidget {
 const UserList({Key? key}) : super(key: key);
 @override
 State<UserList> createState() => _UserListState();
}
class _UserListState extends State<UserList> {
 late List<User> allUsers;
 late List<User> allUsersSearched;
 late bool searching; 
 @override
 void initState() {
 super.initState();
// La fonction emit() peut être appelée depuis cette interface via BlocProvider.of<>(contexte) et émettre des états si nécessaire.
 BlocProvider.of<UserCubit>(context).getAllUsers();
 allUsersSearched = [];
 searching = false;
 }
 _list() {
 // le retour doit être de type widget
 return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
 if (state is UsersLoaded) {
 allUsers = (state).users;
 return CustomScrollView(
 slivers: [
 // SliverList doit avoir une liste
 SliverList(
 delegate: SliverChildListDelegate(_buildList(),),
 ),
 ],
 );
 } else {
 return _showLoadingIndicator();
 }
 });
 }
 _buildList() {
 if(searching){
List<Widget> widgets = allUsersSearched.map((item) => _listCard(item)
).toList();
return widgets;
 }
 else {
List<Widget> widgets = allUsers.map((item) => _listCard(item) ).toList();
return widgets;
 } 
 }
Widget _listCard(item) {
 return Column(
   children: [
     Card (
     margin: const EdgeInsets.all(10),
     elevation: 20,
     shape: const RoundedRectangleBorder(
     side: BorderSide(color: Colors.teal,width: 3),
     borderRadius: BorderRadius.all(Radius.circular(15))
     ),
     shadowColor: Colors.green[100],
     child: Column(
     mainAxisSize: MainAxisSize.min,
     children: <Widget>[
     ListTile(
     leading: const Icon (
     Icons.album,
     color: Colors.cyan,
     size: 45
     ),
     title: Text('${item.name}',
     style: const TextStyle(fontSize: 20),
     ),
     subtitle: Text('${item.email}'),
     ),
     ],
     ),
),
_cubitsearched(),
 ], 

 );
}
_cubitsearched(){

 return BlocListener<SearchCubit,SearchState>(
 listenWhen: (previous, current){
 return previous != current;
 },
listener: (context, state) {
 if (state is UserSearch) {
 final searched = (state).userName.toString();
 if (searched.isNotEmpty) {
 searching = true;
 _addSearchedForItems(searched);
 }
 else {
 searching = false;
 }
 }
 setState(() {});
 }, 

child : Container(),
 );
}
void _addSearchedForItems(String searchedUser) {
 allUsersSearched = allUsers
 .where((user) =>
 user.name!.toLowerCase().startsWith(searchedUser))
 .toList();
 setState(() {});
 } 


 _showLoadingIndicator() {
 return const Center(
 child: CircularProgressIndicator(
 color: Colors.amber,
 ));
 }
 @override
 Widget build(BuildContext context) {

 return
 Container(
 width: double.infinity,
 padding: const EdgeInsets.symmetric(horizontal:15,
vertical:10),
 color: Colors.grey[100],
 child :_list(),

 );

 }
}