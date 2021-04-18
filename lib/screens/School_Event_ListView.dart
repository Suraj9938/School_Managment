import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/event_provider.dart';
import 'package:school_management/screens/Event_Details.dart';

class SchoolEventListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final eventData = Provider.of<EventProvider>(context, listen: false)
        .setFetchEventData();

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 8,
        ),
        padding: EdgeInsets.only(
          left: 20,
          right: 28,
        ),
        height: MediaQuery.of(context).size.height / 2.4,
        child: FutureBuilder(
          future: eventData,
          builder: (context, snapShotData) {
            return Consumer<EventProvider>(
              builder: (context, event, _) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                    value: event.events[index],
                    child: EventDetails(),
                  ),
                  itemCount: event.events.length,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
