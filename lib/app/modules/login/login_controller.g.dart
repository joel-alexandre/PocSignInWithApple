// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<ResultState> _$stateComputed;

  @override
  ResultState get state =>
      (_$stateComputed ??= Computed<ResultState>(() => super.state)).value;

  final _$loggedUserAtom = Atom(name: '_LoginControllerBase.loggedUser');

  @override
  User get loggedUser {
    _$loggedUserAtom.context.enforceReadPolicy(_$loggedUserAtom);
    _$loggedUserAtom.reportObserved();
    return super.loggedUser;
  }

  @override
  set loggedUser(User value) {
    _$loggedUserAtom.context.conditionallyRunInAction(() {
      super.loggedUser = value;
      _$loggedUserAtom.reportChanged();
    }, _$loggedUserAtom, name: '${_$loggedUserAtom.name}_set');
  }

  final _$loginWithAppleAsyncAction = AsyncAction('loginWithApple');

  @override
  Future<dynamic> loginWithApple() {
    return _$loginWithAppleAsyncAction.run(() => super.loginWithApple());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  Future<dynamic> loginWithEmail() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.loginWithEmail();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'loggedUser: ${loggedUser.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
