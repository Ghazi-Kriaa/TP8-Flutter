part of 'search_cubit.dart';
@immutable
abstract class SearchState {}
class SearchInitial extends SearchState {}
class UserSearch extends SearchState {
final String userName;
 UserSearch(this.userName);

} 
