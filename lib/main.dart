import 'package:flutter/material.dart';
import 'package:flash_chat_uzair/screens/welcome_screen.dart';
import 'package:flash_chat_uzair/screens/login_screen.dart';
import 'package:flash_chat_uzair/screens/registration_screen.dart';
import 'package:flash_chat_uzair/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
