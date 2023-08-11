import 'package:flash_chat/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*  theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ), */
      //home: WelcomeScreen(),
      initialRoute: AppNavigation.home,
      routes: {
        AppNavigation.home: (context) => WelcomeScreen(),
        AppNavigation.login: (context) => LoginScreen(),
        AppNavigation.register: (context) => RegistrationScreen(),
        AppNavigation.chat: (context) => ChatScreen(),
      },
    );
  }
}
