import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savestreak/providers/budget_provider.dart';

class UpdateFinancialInfoScreen extends StatefulWidget {
  @override
  _UpdateFinancialInfoScreenState createState() => _UpdateFinancialInfoScreenState();
}

class _UpdateFinancialInfoScreenState extends State<UpdateFinancialInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  double _income = 0;
  double _budget = 0;

  @override
  Widget build(BuildContext context) {
    final budgetProvider = Provider.of<BudgetProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Financial Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Income'),
                keyboardType: TextInputType.number,
                initialValue: budgetProvider.income.toString(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your income';
                  }
                  _income = double.parse(value);
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Budget'),
                keyboardType: TextInputType.number,
                initialValue: budgetProvider.budget.toString(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your budget';
                  }
                  _budget = double.parse(value);
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    budgetProvider.setIncome(_income);
                    budgetProvider.setBudgetValue(_budget);
                    Navigator.pop(context);
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
