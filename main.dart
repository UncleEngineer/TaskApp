import 'package:flutter/material.dart';
import 'package:taskapp/pages/add.dart';
import 'package:taskapp/pages/history.dart';
import 'package:taskapp/pages/home.dart';
import 'package:taskapp/pages/more.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // selected index
  int _currentIndex = 0;
  // all tabs page
  final tabs = [FirstPage(), AddPage(), HistoryPage(), MorePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List"),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_comment),
              label: 'Add',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.more),
              label: 'More',
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            print("--------");
            print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
