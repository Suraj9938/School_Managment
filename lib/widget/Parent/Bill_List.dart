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
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    leading: Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bills[index].title,
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(bills[index].date),
                            style: Theme.of(context).textTheme.title.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      "\$${bills[index].amount.toString()}",
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
