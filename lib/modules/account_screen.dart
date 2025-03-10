import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override  
  Widget build (BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: 0, onItemTapped: onItemTapped),
      body: Center(
        child: Column(
          children: [
            Text('Hello')
          ],
        ),
      ),
    );
  }
}