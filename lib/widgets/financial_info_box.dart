import 'package:flutter/material.dart';

class FinancialInfoBox extends StatelessWidget {
  final double totalAssets;
  final double totalExpenses;
  final double netIncome;
  final double income;
  final double budget;

  FinancialInfoBox({
    required this.totalAssets,
    required this.totalExpenses,
    required this.netIncome,
    required this.income,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Financial Overview',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Total Assets: \$${totalAssets.toStringAsFixed(2)}'),
          Text('Total Expenses: \$${totalExpenses.toStringAsFixed(2)}'),
          Text('Net Income: \$${netIncome.toStringAsFixed(2)}'),
          Text('Income: \$${income.toStringAsFixed(2)}'),
          Text('Budget: \$${budget.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
