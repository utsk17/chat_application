import 'package:endgame_application/screens/chat.dart';
import 'package:endgame_application/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:endgame_application/screens/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Chat Application',
        theme: ThemeData().copyWith(
          // useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 63, 17, 177)),
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            //the if method is used below to show different screens for different circumstances
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                //for the loading time or screen over here
                return const SplashScreen();
              }

              if (snapshot.hasData) {
                return const ChatScreen(); //this is for logged in user
              }

              return const AuthScreen(); //if not logged in
            }));
  }
}
