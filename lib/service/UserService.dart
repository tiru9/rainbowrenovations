import 'package:rainbowrenovations/resource/user_provider.dart';

class UserService {
  final _userProvider = UserProvider();
  Future<bool> isUserExists(String mobile) =>
      _userProvider.isUserExists(mobile);

  Future<bool> addUser(String mobile, String uid, String name,
          String lastSigned, String email) =>
      _userProvider.addUser(mobile, uid, name, lastSigned, email);
}
