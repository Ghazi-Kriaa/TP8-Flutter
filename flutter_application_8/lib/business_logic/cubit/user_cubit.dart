import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/modelUser.dart';
import '../../data/repository/users_repository.dart';
part 'user_state.dart';
class UserCubit extends Cubit<UserState> {
 final UserRepository userRepository;
 List<User> users =[];
 UserCubit(this.userRepository) : super(UserInitial());
 List<User> getAllUsers() {
 userRepository.getAllUsers().then((users){
 emit(UsersLoaded(users));
 this.users = users;
 });
 return this.users;
 }

}