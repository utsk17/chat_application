import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat App'),
        //below is defined to add some actions to the application
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut(); //will sign out the user
            },
            icon: Icon(Icons.exit_to_app,
                color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
      body: const Center(
        child: Text('Successfully Logged in'),
      ),
    );
  }
}
