import 'package:flutter/material.dart';
import '../widgets/simple_line_chart.dart';

class BudgetDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detailed Insights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SimpleLineChart(),
            ),
            SizedBox(height: 300),
            Text(
              'Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Here you can display detailed summaries and insights.'),
          ],
        ),
      ),
    );
  }
}
