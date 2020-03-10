import 'package:poc_sign_in_with_apple/app/models/user.dart';
import 'package:poc_sign_in_with_apple/app/modules/login/repository/login_remote.dart';

class LoginRepository {
  LoginRemote _loginRemote;

  LoginRepository(this._loginRemote);

  Future<User> loginWithApple() {
    final user = _loginRemote.loginWithApple();
    return user;
  }
}
