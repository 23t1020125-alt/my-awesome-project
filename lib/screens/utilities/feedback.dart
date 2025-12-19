import 'package:flutter/material.dart';
import '../../widgets/app_styles.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

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
        title: const Text("Feedback", style: TextStyle(color: kDarkColor, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        decoration: kAppBackgroundDecoration,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "We love to hear from you!",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: kDarkColor),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Send us your feedback and help us improve.",
                  style: TextStyle(fontSize: 16, color: kGreyColor),
                ),
                const SizedBox(height: 40),
                const AppTextField(hint: "Subject", icon: Icons.title),
                const SizedBox(height: 20),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: const TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type your message here...",
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Feedback sent! Thank you.")),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kDarkColor,
                      elevation: 10,
                      shadowColor: kDarkColor.withOpacity(0.3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text("Send Feedback", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}