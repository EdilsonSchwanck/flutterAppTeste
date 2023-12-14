// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on Login, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: 'Login.isValid'))
      .value;
  Computed<ValidationResult>? _$validationResultsComputed;

  @override
  ValidationResult get validationResults => (_$validationResultsComputed ??=
          Computed<ValidationResult>(() => super.validationResults,
              name: 'Login.validationResults'))
      .value;

  late final _$userAtom = Atom(name: 'Login.user', context: context);

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$passwordAtom = Atom(name: 'Login.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isVisibilityAtom =
      Atom(name: 'Login.isVisibility', context: context);

  @override
  bool get isVisibility {
    _$isVisibilityAtom.reportRead();
    return super.isVisibility;
  }

  @override
  set isVisibility(bool value) {
    _$isVisibilityAtom.reportWrite(value, super.isVisibility, () {
      super.isVisibility = value;
    });
  }

  late final _$LoginActionController =
      ActionController(name: 'Login', context: context);

  @override
  void setUser(String value) {
    final _$actionInfo =
        _$LoginActionController.startAction(name: 'Login.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$LoginActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo =
        _$LoginActionController.startAction(name: 'Login.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LoginActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibility() {
    final _$actionInfo =
        _$LoginActionController.startAction(name: 'Login.toggleVisibility');
    try {
      return super.toggleVisibility();
    } finally {
      _$LoginActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
password: ${password},
isVisibility: ${isVisibility},
isValid: ${isValid},
validationResults: ${validationResults}
    ''';
  }
}
