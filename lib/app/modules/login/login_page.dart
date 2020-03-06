import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_sign_in_with_apple/app/modules/home/home_module.dart';
import 'package:poc_sign_in_with_apple/app/modules/login/login_controller.dart';
import 'package:poc_sign_in_with_apple/app/modules/login/login_module.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Sign in with Apple"})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _controller = LoginModule.to.get();

  @override
  void initState() {
    super.initState();

    AppleSignIn.onCredentialRevoked.listen((_) {
      print("Credentials revoked");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Image.asset('assets/icarros.png'),
          ),
          Container(height: 20),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'E-mail'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Senha'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.white,
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    print("login email");
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              height: 500,
              child: AppleSignInButton(
                style: ButtonStyle.black,
                type: ButtonType.continueButton,
                onPressed: () async {
                  var user = await _controller.loginWithApple();
                  Modular.to.pop();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
