import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInModel extends ChangeNotifier {
  // SignInModel(this.email, this.password) {
  //   emailController.text = email;
  //   passwordController.text = password;
  // }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String email = "";
  String password = "";

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  bool isUpdated() {
    return email.isEmpty || password.isEmpty;
  }

  Future logIn() async {
    email = emailController.text;
    password = passwordController.text;

    final result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return result.user;
  }
}
