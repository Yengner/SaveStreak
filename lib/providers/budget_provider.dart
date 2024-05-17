import 'package:flutter/material.dart';

class BudgetProvider with ChangeNotifier {
  double _totalBudget = 1000.0;
  double _currentSpend = 450.0;
  double _savedAmount = 100.0;
  double _totalAssets = 5000.0;
  double _totalExpenses = 2500.0;
  double _netIncome = 2500.0;
  double _income = 3000.0;
  double _budget = 2000.0;

  double get totalBudget => _totalBudget;
  double get currentSpend => _currentSpend;
  double get savedAmount => _savedAmount;
  double get totalAssets => _totalAssets;
  double get totalExpenses => _totalExpenses;
  double get netIncome => _netIncome;
  double get income => _income;
  double get budget => _budget;

  void updateSpend(double amount) {
    _currentSpend += amount;
    notifyListeners();
  }

  void setBudget(double budget) {
    _totalBudget = budget;
    notifyListeners();
  }

  void setSavedAmount(double amount) {
    _savedAmount = amount;
    notifyListeners();
  }

  void setTotalAssets(double assets) {
    _totalAssets = assets;
    notifyListeners();
  }

  void setTotalExpenses(double expenses) {
    _totalExpenses = expenses;
    notifyListeners();
  }

  void setNetIncome(double income) {
    _netIncome = income;
    notifyListeners();
  }

  void setIncome(double income) {
    _income = income;
    notifyListeners();
  }

  void setBudgetValue(double budget) {
    _budget = budget;
    notifyListeners();
  }
}
