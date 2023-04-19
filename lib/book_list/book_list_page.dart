import 'package:book_list_sample/add_book/add_book_page.dart';
import 'package:book_list_sample/book_list/book_list_model.dart';
import 'package:book_list_sample/domain/book.dart';
import 'package:book_list_sample/edit_book/edit_book_page.dart';
import 'package:book_list_sample/signIn/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  },
                  icon: Icon(Icons.person))
            ],
          ),
          body: Center(child: Consumer<BookListModel>(
            builder: (context, model, child) {
              final List<Book>? books = model.books;
              if (books == null) {
                return const CircularProgressIndicator();
              }

              final List<Widget> widgets = books
                  .map((d) => Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditBookPage(d),
                                ),
                              );
                              model.fetchBookList();
                            },
                            backgroundColor: Colors.black45,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                          SlidableAction(
                            onPressed: (_) =>
                                onDeletePressed(context, model, d.id),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: d.imgUrl != null
                            ? Image.network(d.imgUrl as String)
                            : null,
                        title: Text(d.title),
                        subtitle: Text(d.author),
                      )))
                  .toList();

              return ListView(children: widgets);
            },
          )),
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
                    backgroundColor: Colors.green,
                  );

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

Future onDeletePressed(BuildContext context, BookListModel model, String id) {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text("本の削除"),
        content: const Text("選択した本を削除しますか？"),
        actions: [
          TextButton(
              // ignore: avoid_print
              onPressed: () => Navigator.pop(context),
              child: const Text("キャンセル")),
          TextButton(
              // ignore: avoid_print
              onPressed: () async {
                await model.delete(id);
                Navigator.pop(context);
                model.fetchBookList();
                const snackBar = SnackBar(
                  content: Text("本を削除しました。"),
                  backgroundColor: Colors.green,
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text("削除"))
        ],
      );
    },
  );
}
