import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/book.dart';

class UserBookProvider with ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books {
    return [..._books];
  }

  Future<https.Response> addUserBook(
      Auth _currentUser, Book _selectedBook) async {
    final resUrl = "http://192.168.0.20:8000/api/userbook";
    var url = Uri.parse(resUrl);
    https.Response userBook;

    Map<String, String> userBookInfo = {
      'user': _currentUser.userId.toString(),
      'books': _selectedBook.bookId.toString(),
    };
    userBook = await https.post(url, body: userBookInfo);
    print("User Book from User Book Provider");
    print(userBookInfo);

    return userBook;
  }
}
