import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_sign_in_with_apple/app/models/user.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  User loggedUser;

  String getUserMessage() {
    if (loggedUser == null) {
      return "Desconectado";
    }

    if (loggedUser.success) {
      return "${loggedUser.name} entrou";
    } else {
      return "${loggedUser.message}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(getUserMessage()),
              FlatButton(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () async {
                  var returnedUser = await Modular.to.pushNamed<User>('/login');

                  setState(() {
                    loggedUser = returnedUser;
                  });
                },
              )
            ])));
  }
}
