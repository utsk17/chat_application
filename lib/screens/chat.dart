import 'package:endgame_application/widgets/chat_messages.dart';
import 'package:endgame_application/widgets/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    fcm.subscribeToTopic(
        'chat'); // will give push notification whenever we send one to chat

    //the above is an manual process, and same can be done automatically using functions feature in cloud firebase data
  }

  @override
  void initState() {
    super.initState();

    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(104, 183, 58, 91),
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
          title: const Text(
            'Flutter Chat App',
            style: TextStyle(
              fontStyle: FontStyle.italic, // Set the fontStyle to italic
            ),
          ),
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
        body: const Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
            NewMessage(),
          ],
        ));
  }
}
