import 'package:flutter/material.dart';
import 'package:internshipproject2/cart.dart';
import 'package:internshipproject2/home.dart';
import 'package:internshipproject2/orders/order.dart';
import 'package:internshipproject2/profile/profile.dart';
import 'package:internshipproject2/saveditem.dart';

class BottomNavDemo extends StatefulWidget {
  const BottomNavDemo({super.key});

  @override
  State<BottomNavDemo> createState() => _BottomNavDemoState();
}

class _BottomNavDemoState extends State<BottomNavDemo> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    home(),
    CartPage(),
    order(),
    saveditem(),
    profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/home.png",
              height: 24,
              color: _currentIndex == 0 ? Colors.red : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/cart.png",
              height: 24,
              color: _currentIndex == 1 ? Colors.red : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/3.png",
              height: 24,
              color: _currentIndex == 2 ? Colors.red : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/love.png",
              height: 24,
              color: _currentIndex == 3 ? Colors.red : Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/profile1.png",
              height: 24,
              color: _currentIndex == 4 ? Colors.red : Colors.grey,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
