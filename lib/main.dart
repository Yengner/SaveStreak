import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savestreak/screens/navigator_screens/home_screen.dart';
import 'package:savestreak/screens/navigator_screens/connect_screen.dart';
import 'package:savestreak/screens/navigator_screens/explore_screen.dart';
import 'package:savestreak/screens/navigator_screens/profile_screen.dart';
import 'package:savestreak/screens/navigator_screens/streak_screen.dart';
import 'package:savestreak/providers/budget_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BudgetProvider()),
      ],
      child: MaterialApp(
        title: 'SaveStreak',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey[100], // Set a light grey background for all screens
        ),
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ConnectScreen(),
    StreakScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '', // Remove label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.connect_without_contact),
              label: '', // Remove label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart),
              label: '', // Remove label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: '', // Remove label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '', // Remove label
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 0, 0, 0),
          unselectedItemColor: Colors.grey,
          iconSize: 33,  // Increase icon size
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed, // Ensure all items are fixed and not shifting
        ),
      ),
    );
  }
}
