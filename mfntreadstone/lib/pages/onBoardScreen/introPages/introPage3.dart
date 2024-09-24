import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intropage3 extends StatelessWidget {
  const Intropage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
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
                'https://lottie.host/ae9a67cb-338e-4458-84f5-a8f4567b90bc/IOMIlnTXfR.json',
              ),
            ),
        
            // Create a group text
            const Text(
              'Upgrade your plan and enjoy unlimited features!',
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
