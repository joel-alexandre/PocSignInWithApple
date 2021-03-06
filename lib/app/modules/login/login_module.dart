import 'package:poc_sign_in_with_apple/app/models/user.dart';
import 'package:poc_sign_in_with_apple/app/modules/home/home_module.dart';
import 'package:poc_sign_in_with_apple/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_sign_in_with_apple/app/modules/login/login_page.dart';
import 'package:poc_sign_in_with_apple/app/modules/login/repository/login_remote.dart';
import 'package:poc_sign_in_with_apple/app/modules/login/repository/login_repository.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(Modular.get<LoginRepository>())),
        Bind((i) => LoginRepository(Modular.get<LoginRemote>())),
        Bind((i) => LoginRemote())
      ];

  @override
  List<Router> get routers => [
        Router<User>(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router('/home', module: HomeModule())
      ];

  static Inject get to => Inject<LoginModule>.of();
}
