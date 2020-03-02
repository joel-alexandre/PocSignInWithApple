import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:poc_sign_in_with_apple/app/models/user.dart';
import 'package:poc_sign_in_with_apple/app/modules/home/home_module.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  loginWithApple() async {
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    switch (result.status) {
      case AuthorizationStatus.authorized:
        // entrou
        var authorizationCode =
            String.fromCharCodes(result.credential.authorizationCode);
        var state = result.credential.state;
        var user = result.credential.user;
        var realUserStatus = result.credential.realUserStatus.index;
        var identityToken =
            String.fromCharCodes(result.credential.identityToken);
        var email = result.credential.email;
        var fullName = result.credential.fullName.givenName;

        var token = identityToken.split('.')[1];

        var decodedToken;

        if ((token.length % 4) == 0) {
          decodedToken = base64.decode(token);
        } else {
          decodedToken = base64.decode(token + "=");
        }

        var loggedUser = User.fromJson(String.fromCharCodes(decodedToken));

        // print("authorizationCode: $authorizationCode");
        // print("state: $state");
        // print("user: $user");
        // print("realUserStatus: $realUserStatus");
        // print("identityToken: $identityToken");
        // print("email: $email");
        // print("fullName: $fullName");

        break;
      case AuthorizationStatus.error:
        // não entrou
        print("${result.error.localizedDescription}");
        break;
      case AuthorizationStatus.cancelled:
        // cancelado
        print("usuário cancelou");

        break;
    }
  }
}
