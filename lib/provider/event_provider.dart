import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/event.dart';

class EventProvider with ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events {
    return [..._events];
  }

  Event findById(String id) {
    return _events.firstWhere((event) => event.eventId == id);
  }

  Future<https.Response> addEvent(_events, Uint8List images) async {
    final resUrl = "http://192.168.0.20:8000/api/addevent/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);

    request.files.add(
        https.MultipartFile.fromBytes('image', images, filename: 'event.png'));

    request.fields['eventName'] = _events['eventName'];
    request.fields['eventDate'] = _events['eventDate'];
    request.fields['eventDay'] = _events['eventDay'];
    request.fields['eventStartTime'] = _events['eventStartTime'];
    request.fields['eventEndTime'] = _events['eventEndTime'];
    request.fields['eventDescription'] = _events['eventDescription'];

    print(request.fields['eventName']);
    print(request.fields['eventDate']);
    print(request.fields['eventDay']);
    print(request.fields['eventStartTime']);
    print(request.fields['eventEndTime']);
    print(request.fields['eventDescription']);

    https.Response response = await https.Response.fromStream(
      await request.send(),
    );
    return response;
  }

  Future<https.Response> setFetchEventData() async {
    final resUrl = "http://192.168.0.20:8000/api/viewevent/";
    var url = Uri.parse(resUrl);

    try {
      final response = await https.get(
        url,
      );
      print("Set Fetched Response");
      print(response.body);

      List<dynamic> event = List<dynamic>();
      event = json.decode(response.body);
      print("Event from Event Provider");
      print(event);
      print("event length");
      print(event.length);

      _events.clear();
      for (int i = 0; i < event.length; i++) {
        final eventInfo = Event(
          eventId: event[i]['id'].toString(),
          eventName: event[i]['eventName'],
          eventDate: event[i]['eventDate'],
          eventStartTime: event[i]['eventStartTime'],
          eventEndTime: event[i]['eventEndTime'],
          eventDay: event[i]['eventDay'],
          eventDescription: event[i]['eventDescription'],
          eventImage: event[i]['eventImage'].toString(),
        );
        _events.add(eventInfo);
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }
}
