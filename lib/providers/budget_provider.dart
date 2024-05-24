import 'package:flutter/material.dart';

class BudgetProvider with ChangeNotifier {
  double _totalBudget = 500.0;
  double _currentSpend = 450.0;
  double _savedAmount = 100.0;
  double _totalAssets = 5000.0;
  double _totalExpenses = 2500.0;
  double _netIncome = 2500.0;
  double _income = 3000.0;
  double _budget = 500.0;

  final Map<String, double> _categories = {
    '🚙': 100.0,
    '🍱': 275.0,
    '🍿': 150.0,
    '🛍️': 50.0,
    '🤷‍♂️': 50,
  };

  final Map<String, String> _emojiToWord = {
    'Transportation': '🚙',
    'Food':'🍱',
    'Entertaiment':'🍿',
    'Shopping':'🛍️',
    'Other':'🤷‍♂️',
  };

  double get totalBudget => _totalBudget;
  double get currentSpend => _currentSpend;
  double get savedAmount => _savedAmount;
  double get totalAssets => _totalAssets;
  double get totalExpenses => _totalExpenses;
  double get netIncome => _netIncome;
  double get income => _income;
  double get budget => _budget;
  Map<String, double> get categories => _categories;
  Map<String, String> get emojiToWord => _emojiToWord;

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

  void addCategory(String category, double amount) {
    _categories[category] = amount;
    notifyListeners();
  }

  void removeCategory(String category) {
    _categories.remove(category);
    notifyListeners();
  }

  double totalBudgetSpent()
  {
    return _totalBudget - _currentSpend;
  }

  double totalBudgetLeft()
  {
    return _totalBudget - _currentSpend - _savedAmount;
  }

  double totalBudgetSaved()
  {
    return _savedAmount;
  }

  double totalBudgetRemaining()
  {
    return _totalBudget - _savedAmount;
  }

  double totalBudgetSavedPercentage()
  {
    return (_savedAmount / _totalBudget) * 100;
  }

  double totalBudgetRemainingPercentage()
  {
    return (_totalBudget - _savedAmount) / _totalBudget * 100;
  }

  double maxBudget()
  {
    return _totalBudget;
  }


  double getMaxCategorySpend() {
    return _categories.values.reduce((a, b) => a > b ? a : b);
  }
}
