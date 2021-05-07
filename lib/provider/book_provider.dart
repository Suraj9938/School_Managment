import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/book.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books {
    return [..._books];
  }

  Future<https.Response> addBook(_bookData, images) async {
    final resUrl = "http://192.168.0.20:8000/api/addbook/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);

    request.files.add(https.MultipartFile.fromBytes('image', images, filename: "book.png"));

    request.fields['bookName'] = _bookData['bookName'];
    request.fields['bookType'] = _bookData['bookType'];
    request.fields['publisher'] = _bookData['publisher'];
    request.fields['publishYear'] = _bookData['publishYear'];
    request.fields['ratingNo'] = _bookData['ratingNo'];
    request.fields['userRating'] = _bookData['userRating'];
    request.fields['bookDescription'] = _bookData['bookDescription'];

    await request.send();
  }

  Future<https.Response> setFetchedBooksData() async {
    final resUrl = "http://192.168.0.20:8000/api/viewbook/";
    var url = Uri.parse(resUrl);

    try {
      final response = await https.get(
        url,
      );
      print("Set Fetched Response");
      print(response.body);

      List<dynamic> book = List<dynamic>();
      book = json.decode(response.body);
      for (int i = 0; i < book.length; i++) {
        var bookRes = book[i];
        final bookInfo = Book(
          bookId: bookRes['id'].toString(),
          bookName: bookRes['bookName'],
          bookType: bookRes['bookType'],
          bookImage: bookRes['image'].toString(),
          publisher: bookRes['publisher'],
          publishYear: bookRes['publishYear'],
          ratingNo: bookRes['ratingNo'],
          userRating: bookRes['userRating'],
          bookDescription: bookRes['bookDescription'],
        );
        _books.add(bookInfo);
        print("Book Info");
        print(bookInfo);
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }
}