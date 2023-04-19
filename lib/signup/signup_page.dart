import 'package:book_list_sample/signup/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ユーザーの追加"),
        ),
        body: Center(
            child: Consumer<SignUpModel>(builder: (context, model, child) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "メールアドレス",
                    ),
                    onChanged: (text) => model.setEmail(text),
                    controller: model.emailController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "パスワード",
                    ),
                    onChanged: (text) => model.setPassword(text),
                    controller: model.passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () => model.signUp(),
                    child: const Text("登録"),
                  ),
                ],
              ));
        })),
      ),
    );
  }
}
