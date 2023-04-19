import 'package:book_list_sample/book_list/book_list_page.dart';
import 'package:book_list_sample/signIn/signin_model.dart';
import 'package:book_list_sample/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInModel>(
      create: (_) => SignInModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ログイン"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Consumer<SignInModel>(builder: (context, model, child) {
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
                    onPressed: () async {
                      try {
                        final user = await model.logIn();
                        if (user != null) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookListPage()));
                        }
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    child: const Text("ログイン"),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      child: const Text("ユーザーを作成"))
                ],
              ));
        })),
      ),
    );
  }
}
