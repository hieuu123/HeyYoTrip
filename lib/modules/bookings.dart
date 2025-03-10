import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/section.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

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