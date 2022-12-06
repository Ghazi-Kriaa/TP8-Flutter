import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/cubit/cubit/search_cubit.dart'; 
class SearchZone extends StatefulWidget {
 const SearchZone({Key? key}) : super(key: key);
 @override
 State<SearchZone> createState() => _SearchZoneState();
}
class _SearchZoneState extends State<SearchZone> {
 TextEditingController textEditingControllerSearch = TextEditingController();

 @override
 Widget build(BuildContext context) {
 return Padding(
 padding: const EdgeInsets.all(8.0),
 child: Row(
 children : [
 Expanded (
 child: TextFormField(
 controller: textEditingControllerSearch,
 decoration: InputDecoration(
 hintText: 'Search',
 border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(20),
 borderSide: const BorderSide(
 width: 2,
 ),
 ),
 ),

 onChanged: (value) {
 if(value.isNotEmpty)
 {BlocProvider.of<SearchCubit>(context).userSearching(textEditingControllerSearch.text);}
 else
 {BlocProvider.of<SearchCubit>(context).userSearching('')
;}
 },
 ), 

 ),
 IconButton(
 onPressed: () {
 /*BlocProvider.of<SearchCubit>(context)
 .userSearching(textEditingControllerSearch.text);*/
 }, 
 icon: const Icon(
 Icons.search,
 color:Colors.teal,
 ),
 ),
 ],
 ),
 );
 }
} 
