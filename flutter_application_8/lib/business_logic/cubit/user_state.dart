part of 'user_cubit.dart';
@immutable
abstract class UserState {}
class UserInitial extends UserState {}
class UsersLoaded extends UserState {
 final List<User> users;
 UsersLoaded(this.users);
}
class UserSuccess extends UserState {}
class ErrorOccured extends UserState {
 final String errorMsg;
 ErrorOccured(this.errorMsg);
} 