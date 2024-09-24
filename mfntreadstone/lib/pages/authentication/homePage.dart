import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'loginOrRegisterPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(LoginOrRegisterPage loginOrRegisterPage){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const  Color(0xFFd4c11c),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Add your menu button functionality here
            },
          ),
          title: const Center(child: Text('Treadstone',
          style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold))),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://placehold.co/50x50')
                ,
              ),
            ),
          ],
        ),
      body: 
        IconButton(
        icon: const Icon(Icons.signpost),
        onPressed: () {
          signUserOut(
           const LoginOrRegisterPage()
          );
        },)
      );
  }
  
}

