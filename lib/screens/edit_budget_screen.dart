import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/budget_provider.dart';

class EditBudgetScreen extends StatefulWidget {
  @override
  _EditBudgetScreenState createState() => _EditBudgetScreenState();
}

class _EditBudgetScreenState extends State<EditBudgetScreen> {
  final _formKey = GlobalKey<FormState>();
  late double totalAssets;
  late double totalExpenses;
  late double netIncome;
  late double income;
  late double budget;

  @override
  void initState() {
    super.initState();
    final budgetProvider = Provider.of<BudgetProvider>(context, listen: false);
    totalAssets = budgetProvider.totalAssets;
    totalExpenses = budgetProvider.totalExpenses;
    netIncome = budgetProvider.netIncome;
    income = budgetProvider.income;
    budget = budgetProvider.budget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Financial Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: totalAssets.toString(),
                decoration: InputDecoration(labelText: 'Total Assets'),
                keyboardType: TextInputType.number,
                onSaved: (value) => totalAssets = double.parse(value!),
              ),
              TextFormField(
                initialValue: totalExpenses.toString(),
                decoration: InputDecoration(labelText: 'Total Expenses'),
                keyboardType: TextInputType.number,
                onSaved: (value) => totalExpenses = double.parse(value!),
              ),
              TextFormField(
                initialValue: netIncome.toString(),
                decoration: InputDecoration(labelText: 'Net Income'),
                keyboardType: TextInputType.number,
                onSaved: (value) => netIncome = double.parse(value!),
              ),
              TextFormField(
                initialValue: income.toString(),
                decoration: InputDecoration(labelText: 'Income'),
                keyboardType: TextInputType.number,
                onSaved: (value) => income = double.parse(value!),
              ),
              TextFormField(
                initialValue: budget.toString(),
                decoration: InputDecoration(labelText: 'Budget'),
                keyboardType: TextInputType.number,
                onSaved: (value) => budget = double.parse(value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final budgetProvider = Provider.of<BudgetProvider>(context, listen: false);
                    budgetProvider.setTotalAssets(totalAssets);
                    budgetProvider.setTotalExpenses(totalExpenses);
                    budgetProvider.setNetIncome(netIncome);
                    budgetProvider.setIncome(income);
                    budgetProvider.setBudgetValue(budget);
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
