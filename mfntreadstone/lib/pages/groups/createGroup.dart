// createGroup.dart
import 'package:flutter/material.dart';
import 'package:mfntreadstone/pages/authentication/homePage.dart';
import 'package:mfntreadstone/pages/firestore/creatinGroup.dart';


class CreateGroup extends StatelessWidget {
  final FirebaseCreateGroup _firebaseCreateGroup = FirebaseCreateGroup();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Group')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Group Name (required)'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Short Description (optional)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String groupName = nameController.text;
                  String description = descriptionController.text;
                  if (groupName.isNotEmpty) {
                    String joinCode = await _firebaseCreateGroup.createGroup(groupName, description);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Group created! Share this code: $joinCode'),
                    ));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(), 
                      )); // Navigate to admin homepage
                  }
                },
                child: Text('Create Group'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
