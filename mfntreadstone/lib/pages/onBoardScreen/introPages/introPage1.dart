import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intropage1 extends StatelessWidget {
  const Intropage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Welcome text
          const Text(
            'Welcome to treadstone, Let\'s Get you started',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // Lottie animation
          Center(
            child: Lottie.network(
              'https://lottie.host/ea668db7-fb21-42b4-82ff-8891fd0edac2/1fouTlv7J5.json',
            ),
          ),

          // Create a group text
          const Text(
            'Create or Join your group with a code',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
