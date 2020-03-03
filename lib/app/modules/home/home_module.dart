import 'package:flutter/material.dart';
import 'package:poc_sign_in_with_apple/app/models/user.dart';
import 'package:poc_sign_in_with_apple/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_sign_in_with_apple/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  // User loggedUser;

  // HomeModule(this.loggedUser);

  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => HomePage(loggedUser: args.data)),
      ];

  // @override
  // Widget get bootstrap => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
