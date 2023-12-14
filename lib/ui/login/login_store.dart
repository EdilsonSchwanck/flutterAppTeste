import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = Login with _$LoginStore;

class ValidationResult {
  final bool isValid;
  final String message;

  ValidationResult(this.isValid, this.message);
}

abstract class Login with Store {
  @observable
  String user = '';

  @observable
  String password = '';

  @observable
  bool isVisibility = true;

  @action
  void setUser(String value) => user = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void toggleVisibility() => isVisibility = !isVisibility;

  @computed
  bool get isValid =>
      user.trim().isNotEmpty &&
      password.trim().isNotEmpty &&
      password.length >= 2 &&
      RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password) &&
      user.length <= 20 &&
      password.length <= 20 &&
      !user.endsWith(" ") &&
      !password.endsWith(" ");

  @computed
ValidationResult get validationResults {
  if (user.trim().isEmpty) {
    return ValidationResult(false, "O campo de usuário não pode estar vazio.");
  }

  if (password.trim().isEmpty) {
    return ValidationResult(false, "O campo de senha não pode estar vazio.");
  }

  if (password.length < 2) {
    return ValidationResult(false, "A senha deve ter pelo menos dois caracteres.");
  }

  if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password)) {
    return ValidationResult(false, "A senha não pode conter caracteres especiais.");
  }


  if (user.length > 20 || password.length > 20) {
    return ValidationResult(false, "Ambos os campos não podem ter mais de 20 caracteres.");
  }

  if (password.endsWith(" ")) {
    return ValidationResult(false, "Campo senha não podem terminar com espaço.");
  }
  if(user.endsWith(" ") ){
    return ValidationResult(false, "Campo Usuário não podem terminar com espaço.");
  }

  return ValidationResult(true, "Campos preenchidos corretamente.");
}

}




