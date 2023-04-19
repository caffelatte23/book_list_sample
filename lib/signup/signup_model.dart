import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
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

  Future signUp() async {
    if (email.isEmpty || password.isEmpty) {
      throw "入力項目が不足しています。";
    }

    email = emailController.text;
    password = passwordController.text;

    // firestoreにユーザー追加
    final result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    final user = result.user;

    if (user != null) {
      final doc = FirebaseFirestore.instance.collection("users").doc();
      await doc.set({"uid": user.uid, "email": email});
    }

    return result.user;
  }
}
