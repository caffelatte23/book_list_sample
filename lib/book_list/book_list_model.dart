import 'package:book_list_sample/domain/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookListModel extends ChangeNotifier {
  List<Book>? books;

  void fetchBookList() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('books').get();

    final List<Book> books = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String title = data["title"];
      final String author = data["author"];
      final String? imgUrl = data["imgUrl"];

      return Book(id, title, author, imgUrl);
    }).toList();

    this.books = books;
    notifyListeners();
  }

  Future delete(String id) {
    return FirebaseFirestore.instance.collection("books").doc(id).delete();
  }
}
