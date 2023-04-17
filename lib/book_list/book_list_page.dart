import 'package:book_list_sample/book_list/book_list_model.dart';
import 'package:book_list_sample/domain/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class BookListPage extends StatefulWidget {
//   const BookListPage({super.key});

//   @override
//   State<BookListPage> createState() => _BookListState();
// }

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
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          tooltip: "Increment",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
