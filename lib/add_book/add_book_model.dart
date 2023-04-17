import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {
  String? title;
  String? author;

  Future addBook() async {
    if (title == null || author == null || title!.isEmpty || author!.isEmpty) {
      throw "入力項目が不足しています。";
    }

    // firestoreに追加
    await FirebaseFirestore.instance.collection("books").add(
      {
        "title": title,
        "author": author,
      },
    );
  }
}
