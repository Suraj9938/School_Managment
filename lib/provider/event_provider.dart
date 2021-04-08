import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;

class EventProvider with ChangeNotifier {
  Future<https.Response> addEvent(_events, images) async {
    final resUrl = "http://192.168.0.14:8000/api/addevent/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);

    request.files.add(https.MultipartFile.fromBytes('image', images, filename: 'event.png'));

    request.fields['eventName'] = _events['eventName'];
    request.fields['eventDate'] = _events['eventDate'];
    request.fields['eventDay'] = _events['eventDay'];
    request.fields['eventStartTime'] = _events['eventStartTime'];
    request.fields['eventEndTime'] = _events['eventEndTime'];
    request.fields['eventDescription'] = _events['eventDescription'];

    var res = await request.send();
  }
}
