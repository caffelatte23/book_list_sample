import 'package:book_list_sample/domain/book.dart';
import 'package:book_list_sample/edit_book/edit_book_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditBookPage extends StatelessWidget {
  const EditBookPage(this.book, {super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditBookModel>(
      create: (_) => EditBookModel(book),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("本の編集"),
        ),
        body: Center(
            child: Consumer<EditBookModel>(builder: (context, model, child) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "本のタイトル",
                    ),
                    onChanged: (text) => model.setTitle(text),
                    controller: model.titleController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "著者",
                    ),
                    onChanged: (text) => model.setAuthor(text),
                    controller: model.authorController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: model.isUpdated()
                        ? () async {
                            try {
                              await model.update();
                              Navigator.of(context).pop(book.title);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        : null,
                    child: const Text("保存する"),
                  )
                ],
              ));
        })),
      ),
    );
  }
}
