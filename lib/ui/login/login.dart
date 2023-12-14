import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova/model/url_launcher_service.dart';
import 'package:prova/ui/home/home.dart';
import 'package:prova/ui/login/login_store.dart';
import 'package:prova/utils/dialog_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FocusNode _focusUser = FocusNode();
  final FocusNode _focusPassword = FocusNode();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LoginStore _loginStore = LoginStore();

  @override
  void dispose() {
    _focusUser.dispose();
    _focusPassword.dispose();
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleScreenTap() {
    _focusUser.unfocus();
    _focusPassword.unfocus();
  }

   void _openPrivacyPolicy() {
      UrlLauncherService.openUrl('https://www.google.com/');
  }

  void _validateAndProceed() {
  ValidationResult result = _loginStore.validationResults;

  if (result.isValid) {
     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
  } else {
     DialogUtils.showAlertDialog(context, 'Alerta', result.message);
   
  }
}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _handleScreenTap,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: _handleScreenTap,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 2, 105, 112),
                      Color.fromARGB(255, 186, 244, 248),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.40),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        height: 55,
                        child: TextFormField(
                          controller: _userController,
                          focusNode: _focusUser,
                          onChanged: _loginStore.setUser,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 223, 222, 222),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 13.5, vertical: 13.5),
                            hintText: 'Usuário',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: size.width * 0.9,
                        child: TextFormField(
                          controller: _passwordController,
                          focusNode: _focusPassword,
                          onChanged: _loginStore.setPassword,
                          obscureText: _loginStore.isVisibility,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 223, 222, 222),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 13.5, vertical: 13.5),
                            hintText: 'Senha',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _loginStore.toggleVisibility();
                                });
                              },
                              icon: _loginStore.isVisibility
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                            ),
                          ),
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                      
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 5),
                        child: Stack(
                          children: [
                            ElevatedButton(
                              onPressed: _validateAndProceed,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                backgroundColor:
                                    Color.fromARGB(255, 17, 219, 135),
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Entrar".toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _openPrivacyPolicy,
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * 0.30),
                        child: const Text(
                          "Politica de privacidade",
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 3, 3),
                            
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}