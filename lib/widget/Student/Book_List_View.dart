import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/book_provider.dart';
import 'package:school_management/widget/Student/Book_Details.dart';

class BookListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookData =
        Provider.of<BookProvider>(context, listen: false).setFetchedBooksData();

    return FutureBuilder(
      future: bookData,
      builder: (context, snapshot) {
        return Consumer<BookProvider>(
          builder: (context, book, _) {
            return ListView.builder(
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                value: book.books[index],
                child: BookDetails(),
              ),
              itemCount: book.books.length,
            );
          },
        );
      },
    );
  }
}
