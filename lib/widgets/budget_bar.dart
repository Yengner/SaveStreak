import 'package:flutter/material.dart';

class BudgetBar extends StatelessWidget {
  final double totalBudget;
  final double currentSpend;

  BudgetBar({required this.totalBudget, required this.currentSpend});

  @override
  Widget build(BuildContext context) {
    double fillPercentage = (currentSpend / totalBudget).clamp(0.0, 1.0);
    Color barColor = fillPercentage < 1.0 ? Colors.green : Colors.red;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 20,
          child: LinearProgressIndicator(
            value: fillPercentage,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(barColor),
          ),
        ),
        SizedBox(height: 5),
        Text(
          '\$${currentSpend.toStringAsFixed(2)} / \$${totalBudget.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
