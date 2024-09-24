import 'package:flutter/material.dart';

class JoinGroup extends StatelessWidget {
  const JoinGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeController = TextEditingController();

    return Scaffold( 
      appBar: AppBar(
        title: const Text('Join Group', style:TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Join a Group',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: 'Enter Join Code (8 characters)',
                  border: OutlineInputBorder(),
                ),
                maxLength: 8,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle join group functionality
                  String code = codeController.text;
                  if (code.length == 8) {
                    // Logic to join group
                  }
                },
                child: const Text('Join'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}