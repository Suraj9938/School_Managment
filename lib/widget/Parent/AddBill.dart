import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddBill extends StatefulWidget {
  final Function addBill;

  AddBill(this.addBill);

  @override
  _AddBillState createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  final titleController = new TextEditingController();
  final amountController = new TextEditingController();
  DateTime _selectedDateTime;

  void _submitData() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0 || _selectedDateTime == null) {
      return;
    }
    widget.addBill(title, amount, _selectedDateTime);
    Navigator.pop(context);
  }

  void _pickDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime(2022))
        .then((pickDate) {
      setState(() {
        _selectedDateTime = pickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Enter product name"),
                controller: titleController,
                onSubmitted: (_) {
                  _submitData();
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Enter product amount"),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) {
                  _submitData();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _selectedDateTime == null
                        ? "No date choosen"
                        : "PickedDate ${DateFormat.yMd().format(_selectedDateTime).toString()}",
                    style: TextStyle(fontSize: 18),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Choose a date",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontFamily: "font1"),
                    ),
                    onPressed: _pickDate,
                  ),
                ],
              ),
              RaisedButton(
                child: Text(
                  "Add Product",
                ),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: () {
                  _submitData();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
