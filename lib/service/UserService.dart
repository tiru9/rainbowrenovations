import 'package:rainbowrenovations/resource/user_provider.dart';

class UserService {
  final _userProvider = UserProvider();
  Future<bool> isUserExists(String mobile) =>
       _userProvider.isUserExists(mobile);
}
