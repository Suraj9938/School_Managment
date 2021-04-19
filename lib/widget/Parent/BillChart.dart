import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management/model/bill.dart';
import 'package:school_management/widget/Parent/BillChartBar.dart';

class BillChart extends StatelessWidget {
  final List<Bill> recentBills;

  BillChart(this.recentBills);

  List<Map<String, Object>> get groupedExpenses {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < recentBills.length; i++) {
        if (recentBills[i].date.day == weekDay.day &&
            recentBills[i].date.month == weekDay.month &&
            recentBills[i].date.year == weekDay.year) {
          totalSum += int.parse(recentBills[i].amount);
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpendAmount {
    return groupedExpenses.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: groupedExpenses.map((tx) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: BillChartBar(
                    day: tx['day'],
                    spendamount: tx['amount'],
                    spendPercent: totalSpendAmount == 0.0
                        ? 0.0
                        : (tx['amount'] as double) / totalSpendAmount,
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}