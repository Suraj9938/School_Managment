import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/book.dart';

class UserBookProvider with ChangeNotifier {
  List<UserBook> _userBooks = [];

  List<UserBook> get UserBooks {
    return [..._userBooks];
  }

  Future<https.Response> addUserBook(_currentUser, _selectedBook) async {
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

  Future<void> setFetchUserBook(Auth user) async {
    String url = "http://192.168.0.20:8000/api/viewuserbook/";
    Book books = new Book();

    List<UserBook> userBooking = [];

    try {
      final response = await https.get(url);

      List userBook = json.decode(response.body);
      userBook.forEach((element) {
        if (element['user']['id'].toString() == user.userId) {
          books.bookId = element['books']['id'].toString();
          books.bookName = element['books']['bookName'];
          books.ratingNo = element['books']['ratingNo'];

          userBooking.add(
            new UserBook(
              user: user,
              books: books,
            ),
          );
        }
        _userBooks = userBooking;
        notifyListeners();
      });
    } catch (error) {
      throw (error);
    }
  }
}
