import 'package:flutter/material.dart';
import 'package:school_management/model/bill.dart';
import 'package:school_management/widget/Parent/AddBill.dart';
import 'package:school_management/widget/Parent/BillChart.dart';
import 'package:school_management/widget/Parent/Bill_List.dart';

class ManageBillsScreen extends StatefulWidget {
  static const routeName = 'managebills';

  @override
  _ManageBillsScreenState createState() => _ManageBillsScreenState();
}

class _ManageBillsScreenState extends State<ManageBillsScreen> {
  List<Bill> _billsHistory = [
//    Transaction(title: "Groceries", amount: 50.00, date: DateTime.now()),
//    Transaction(title: "Watch", amount: 100.00, date: DateTime.now()),
//    Transaction(title: "Shoes", amount: 120.00, date: DateTime.now()),
  ];

  String title;
  double amount;

  List<Bill> get _recentBills {
    return _billsHistory.where((bill) {
      return bill.date.isBefore(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addBill(String billTitle, double billAmount, DateTime billDate) {
    final newBill = Bill(
        title: billTitle,
        amount: billAmount.toString(),
        date: billDate,
        billId: DateTime.now().toString());

    setState(() {
      _billsHistory.add(newBill);
    });
  }

  void _deleteBill(String id) {
    setState(() {
      _billsHistory.removeWhere((bills) {
        return bills.billId == id;
      });
    });
  }

  void _showAddBill(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return AddBill(_addBill);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Track Student Bills",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 160, child: BillChart(_recentBills)),
            Container(
              height: 400,
              child: BillList(
                _billsHistory,
                _deleteBill,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => _showAddBill(
            context), // function is required something as it's parameter
      ),
    );
  }
}
