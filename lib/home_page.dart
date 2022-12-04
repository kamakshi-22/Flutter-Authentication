import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Signed In as',
            style: TextStyle(fontSize: 16),
            ),
          const SizedBox(height: 8,),
          Text(
            user.email!,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 40,),
          ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.arrow_back, size: 32,),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 24),
                ), 
                onPressed: () => FirebaseAuth.instance.signOut(),
              ),
        ],
      ),
    );
  }
}
