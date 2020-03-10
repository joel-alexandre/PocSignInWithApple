import 'package:poc_sign_in_with_apple/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_sign_in_with_apple/app/modules/home/home_page.dart';
import 'package:poc_sign_in_with_apple/app/modules/login/login_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/login', module: LoginModule())
      ];

  static Inject get to => Inject<HomeModule>.of();
}
