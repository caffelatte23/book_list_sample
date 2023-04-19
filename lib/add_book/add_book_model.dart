import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBookModel extends ChangeNotifier {
  String? title;
  String? author;
  File? imageFile;

  bool isLoading = false;

  final picker = ImagePicker();

  void setLoading(bool status) {
    isLoading = status;
  }

  Future addBook() async {
    if (title == null || author == null || title!.isEmpty || author!.isEmpty) {
      throw "入力項目が不足しています。";
    }

    final doc = FirebaseFirestore.instance.collection("books").doc();
    String? imgUrl;

    if (imageFile != null) {
      imgUrl = await uploadImage(doc.id);
    }

    // firestoreに追加
    await doc.set(
      {"title": title, "author": author, "imgUrl": imgUrl},
    );
  }

  Future uploadImage(String id) async {
    final task =
        await FirebaseStorage.instance.ref("books/$id.png").putFile(imageFile!);
    return task.ref.getDownloadURL();
  }

  Future pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage?.path != null) {
      imageFile = File(pickedImage!.path);
      notifyListeners();
    }
  }
}
