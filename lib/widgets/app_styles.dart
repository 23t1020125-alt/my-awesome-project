import 'package:flutter/material.dart';

const Color kTopColor = Color(0xFFD0F0EE);
const Color kBottomColor = Color(0xFFFFE3B3);
const Color kDarkColor = Color(0xFF1A1A1A);
const Color kGreyColor = Color(0xFF505050);

const BoxDecoration kAppBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [kTopColor, kBottomColor],
  ),
);

class AppTextField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;

  const AppTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Center(
        child: TextField(
          obscureText: widget.isPassword ? _obscureText : false,
          style: const TextStyle(color: kDarkColor, fontSize: 16),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.black54),
            icon: Icon(widget.icon, color: Colors.black54),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black45,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}