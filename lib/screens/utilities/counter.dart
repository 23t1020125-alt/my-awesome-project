import 'package:flutter/material.dart';
import '../../widgets/app_styles.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() => _counter--);
  void _reset() => setState(() => _counter = 0);

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
        title: const Text("Counter Tool", style: TextStyle(color: kDarkColor, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        decoration: kAppBackgroundDecoration,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Current Count", style: TextStyle(fontSize: 20, color: kGreyColor)),
              const SizedBox(height: 20),
              Text(
                "$_counter",
                style: const TextStyle(fontSize: 100, fontWeight: FontWeight.w900, color: kDarkColor),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(Icons.remove, _decrement),
                  const SizedBox(width: 20),
                  _buildButton(Icons.refresh, _reset, isReset: true),
                  const SizedBox(width: 20),
                  _buildButton(Icons.add, _increment),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onTap, {bool isReset = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: isReset ? Colors.white : kDarkColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: kDarkColor.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 30,
          color: isReset ? kDarkColor : Colors.white,
        ),
      ),
    );
  }
}