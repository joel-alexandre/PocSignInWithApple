import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_sign_in_with_apple/app/models/user.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  final User loggedUser;

  const HomePage({Key key, this.title = "Home", this.loggedUser})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  Widget showMessage() {
    if (widget.loggedUser.success) {
      return Text("${widget.loggedUser.name} entrou");
    } else {
      return Text("${widget.loggedUser.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: showMessage());
  }
}
