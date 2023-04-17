import 'package:book_list_sample/add_book/add_book_page.dart';
import 'package:book_list_sample/book_list/book_list_model.dart';
import 'package:book_list_sample/domain/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBookList(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Book List"),
          ),
          body: Center(
              child: Consumer<BookListModel>(builder: (context, model, child) {
            final List<Book>? books = model.books;
            if (books == null) {
              return const CircularProgressIndicator();
            }

            final List<Widget> widgets = books
                .map((d) =>
                    ListTile(title: Text(d.title), subtitle: Text(d.author)))
                .toList();

            return ListView(children: widgets);
          })),
          floatingActionButton:
              Consumer<BookListModel>(builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: () async {
                final bool? isAdded = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddBookPage(),
                    fullscreenDialog: true,
                  ),
                );

                if (isAdded != null && isAdded) {
                  const snackBar = SnackBar(
                      content: Text("本を追加しました。"),
                      backgroundColor: Colors.green);

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                model.fetchBookList();
              },
              tooltip: "Increment",
              child: const Icon(Icons.add),
            );
          })),
    );
  }
}
