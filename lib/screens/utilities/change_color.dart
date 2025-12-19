import 'package:flutter/material.dart';
import 'dart:math';
import '../../widgets/app_styles.dart';

class ChangeColorScreen extends StatefulWidget {
  const ChangeColorScreen({super.key});

  @override
  State<ChangeColorScreen> createState() => _ChangeColorScreenState();
}

class _ChangeColorScreenState extends State<ChangeColorScreen> {
  Color _backgroundColor = Colors.white;
  final Random _random = Random();

  void _changeColor() {
    setState(() {
      _backgroundColor = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: kDarkColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Color Changer", style: TextStyle(color: kDarkColor, fontWeight: FontWeight.bold)),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: GestureDetector(
            onTap: _changeColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: kDarkColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: kDarkColor.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5)),
                ],
              ),
              child: const Text(
                "Tap Me!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}