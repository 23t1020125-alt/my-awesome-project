import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/auth/login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Duong App',
      theme: ThemeData(
        fontFamily: 'Arial',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const LoginScreen(),
    );
  }
}