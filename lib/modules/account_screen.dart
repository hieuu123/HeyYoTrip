import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/section.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override  
  Widget build (BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
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