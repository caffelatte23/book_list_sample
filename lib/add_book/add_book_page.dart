import 'package:book_list_sample/add_book/add_book_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  const AddBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Book List"),
        ),
        body: Center(
            child: Consumer<AddBookModel>(builder: (context, model, child) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "本のタイトル",
                    ),
                    onChanged: (text) {
                      model.title = text;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "著者",
                    ),
                    onChanged: (text) {
                      model.author = text;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await model
                            .addBook()
                            .then((value) => Navigator.of(context).pop(true));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: const Text("追加する"),
                  )
                ],
              ));
        })),
      ),
    );
  }
}
