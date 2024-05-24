import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/budget_provider.dart';
import 'package:savestreak/widgets/categorized_box_chart.dart';

class CategorizedSpendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorized Spend'),
      ),
      body: Consumer<BudgetProvider>(
        builder: (context, budgetProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10),
                Expanded(
                  child: CategorizedBoxChart(showNumbers: false), // Show numbers on categorized spend screen
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: budgetProvider.categories.length,
                    itemBuilder: (context, index) {
                      String category = budgetProvider.categories.keys.elementAt(index);
                      double spend = budgetProvider.categories[category]!;
                      return ListTile(
                        title: Text(category),
                        trailing: Text('\$${spend.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
