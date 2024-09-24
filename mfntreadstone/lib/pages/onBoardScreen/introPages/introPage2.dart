import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intropage2 extends StatelessWidget {
  const Intropage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Welcome text
            const Text(
              '',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            // Lottie animation
            Center(
              child: Lottie.network(
                'https://lottie.host/47a8b1aa-9c4d-4f3c-b662-d4d395e54260/opi17plIkm.json',
              ),
            ),
        
            // Create a group text
            const Text(
              'Start assigning tasks and monitor your Team\'s Progress',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
