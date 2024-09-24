// firebasecreation.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FirebaseCreateGroup {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createGroup(String groupName, String description) async {
    String groupId = Uuid().v4(); // Generate a unique group ID (UUID)
    String joinCode = groupId.substring(0, 8); // Shorten it to 8 characters for join code
    
    // Create the group in Firestore
    await _firestore.collection('groups').doc(groupId).set({
      'groupName': groupName,
      'description': description,
      'joinCode': joinCode,
      'admin': true, // Store the admin flag
    });

    return joinCode; // Return the join code to be shared
  }
}


