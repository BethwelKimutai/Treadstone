// firebasejoin.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseJoinGroup {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> joinGroup(String joinCode) async {
    // Search Firestore for the group with the matching join code
    QuerySnapshot groupSnapshot = await _firestore
        .collection('groups')
        .where('joinCode', isEqualTo: joinCode)
        .limit(1)
        .get();

    if (groupSnapshot.docs.isNotEmpty) {
      // Join successful, add the user to the group members collection
      String groupId = groupSnapshot.docs[0].id;
      await _firestore.collection('groups').doc(groupId).collection('members').add({
        'userId': 'YOUR_USER_ID', // Add the user's ID or details here
      });
      return true; // Join successful
    } else {
      return false; // Invalid join code
    }
  }
}
