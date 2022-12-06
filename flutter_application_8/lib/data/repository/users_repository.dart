import '../models/modelUser.dart';
import '../web_services.dart/user_services.dart';
class UserRepository {
 final UserServices userServices;
 UserRepository(this.userServices);
 Future<List<User>> getAllUsers() async {
 final users = await userServices.getAllUsers();
 return users.map((user) => User.fromJson(user)).toList();
 }
} 