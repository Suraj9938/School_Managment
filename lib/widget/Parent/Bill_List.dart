import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management/model/bill.dart';

class BillList extends StatelessWidget {
  final List<Bill> bills;
  final Function deleteBills;

  BillList(this.bills, this.deleteBills);

  @override
  Widget build(BuildContext context) {
    return bills.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    "No bill has been added",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontFamily: "font1"),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Image.asset(
                    "assets/images/Box.png",
                    height: constraints.maxHeight * 0.8,
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundColor: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            "\$${bills[index].amount.toString()}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      bills[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      //DateFormat.yMMMEd().format(tx.date), // for only date
                      DateFormat.yMMMEd().add_jms().format(bills[index].date),
                      style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.deepOrange,
                        size: 32,
                      ),
                      onPressed: () {
                        deleteBills(bills[index].billId);
                      },
                    ),
                  ));
            },
            itemCount: bills.length,
          );
  }
}
