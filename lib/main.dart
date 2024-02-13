import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/firebase_options.dart';
import 'package:login/login/login.dart';

//import 'package:yummy_chat_lecture1/screens/main_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting app',
      theme: ThemeData(
      ),

      home: LoginSignupScreen(),
    );
  }
}