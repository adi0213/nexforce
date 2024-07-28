import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  Third({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text(''),
      ),
      body: const Center(
        child: Text(
          'Congrats!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
