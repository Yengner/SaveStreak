import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../widgets/budget_bar.dart';
import '../../providers/budget_provider.dart';
import '../../widgets/info_box.dart';
import '../../widgets/simple_line_chart.dart';
import '../budget_details_screen.dart';
import '../edit_budget_screen.dart';
import '../categorized_spend_screen.dart';
import '../../widgets/categorized_box_chart.dart';
import '../../widgets/large_info_box.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> gridItems = [];

  @override
  void initState() {
    super.initState();
    final budgetProvider = Provider.of<BudgetProvider>(context, listen: false);
    gridItems = [
      InfoBox(
        key: ValueKey('financial_overview'),
        title: 'Financial Overview',
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Assets: \$${budgetProvider.totalAssets.toStringAsFixed(2)}'),
              Text('Total Expenses: \$${budgetProvider.totalExpenses.toStringAsFixed(2)}'),
              Text('Net Income: \$${budgetProvider.netIncome.toStringAsFixed(2)}'),
              Text('Income: \$${budgetProvider.income.toStringAsFixed(2)}'),
              Text('Budget: \$${budgetProvider.budget.toStringAsFixed(2)}'),
            ],
          ),
        ),
        onTap: () {},
        height: 200.0,
      ),
      InfoBox(
        key: ValueKey('edit_financial_info'),
        title: 'Edit Financial Info',
        child: Center(child: Text('Click to Edit Financial Info')),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditBudgetScreen()),
          );
        },
      ),
      InfoBox(
        key: ValueKey('stats'),
        title: 'Stats',
        child: SimpleLineChart(),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BudgetDetailsScreen()),
          );
        },
      ),
      InfoBox(
        key: ValueKey('categorized_spend'),
        title: 'Categorized Spend',
        child: CategorizedBoxChart(showNumbers: false), // Hide numbers on home screen
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategorizedSpendScreen()),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final String currentDate = DateFormat('MMMM d, y').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.grey[100], // Set a light grey background for the home screen
      appBar: AppBar(
        title: Text('SaveStreak'),
      ),
      body: Consumer<BudgetProvider>(
        builder: (context, budgetProvider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BudgetBar(
                    totalBudget: budgetProvider.totalBudget,
                    currentSpend: budgetProvider.currentSpend,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'You have saved \$${budgetProvider.savedAmount} as of $currentDate',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  
                  
                  SizedBox(height: 20,),
                  LargeInfoBox(
                    key: ValueKey('categorized_spend'),
                    title: 'Categorized Spend',
                    child: CategorizedBoxChart(showNumbers: false), // Hide numbers on home screen
                    onTap: () {
                    Navigator.push(
                        context,
                    MaterialPageRoute(builder: (context) => CategorizedSpendScreen()),
                      );
                    },
                  ),       

                  SizedBox(height: 20),
                  
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: gridItems,
                  ),
                  SizedBox(height: 13),

                ],              
              ),
            ),
          );
        },
      ),
    );
  }
}
