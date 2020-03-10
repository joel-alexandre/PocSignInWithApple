import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:poc_sign_in_with_apple/app/models/user.dart';
import 'package:poc_sign_in_with_apple/app/modules/home/home_module.dart';
import 'package:poc_sign_in_with_apple/app/modules/login/repository/login_repository.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

enum ResultState { initial, loading, loaded }

abstract class _LoginControllerBase with Store {
  LoginRepository _repo;

  _LoginControllerBase(this._repo);

  @observable
  User loggedUser;

  @computed
  ResultState get state {
    if (loggedUser == null) {
      return ResultState.initial;
    }

    if (loggedUser.isLoading) {
      return ResultState.loading;
    }

    if (!loggedUser.success) {
      return ResultState.initial;
    }

    return ResultState.loaded;
  }

  @action
  Future loginWithEmail() {
    loggedUser = User.withLoading();
  }

  @action
  Future loginWithApple() async {
    loggedUser = User.withLoading();
    loggedUser = await _repo.loginWithApple();
  }
}
