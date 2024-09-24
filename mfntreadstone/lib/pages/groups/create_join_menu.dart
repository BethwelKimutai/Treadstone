import 'package:flutter/material.dart';
import 'package:mfntreadstone/pages/groups/createGroup.dart';
import 'package:mfntreadstone/pages/groups/joinGroup.dart';

class CreateJoinMenu extends StatelessWidget {
  const CreateJoinMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[200], // Background color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Information at the top of the page
            Text(
              'Choose an action:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            // Positioned buttons at the bottom of the page
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                children: [
                  // Create Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the create group functionality
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateGroup(), // Replace with actual Create page
                      ));
                    },
                    child: const Text("CREATE"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: (width <= 550)
                          ? const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20)
                          : EdgeInsets.symmetric(
                              horizontal: width * 0.2, vertical: 25),
                      textStyle: TextStyle(
                          fontSize: (width <= 550) ? 13 : 17),
                    ),
                  ),

                  const SizedBox(height: 20), // Space between buttons

                  // Join Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the join group functionality
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => JoinGroup(), // Replace with actual Join page
                      ));
                    },
                    child: const Text("JOIN"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: (width <= 550)
                          ? const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20)
                          : EdgeInsets.symmetric(
                              horizontal: width * 0.2, vertical: 25),
                      textStyle: TextStyle(
                          fontSize: (width <= 550) ? 13 : 17),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}