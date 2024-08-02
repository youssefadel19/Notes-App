import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  const CustomAppBar({super.key, required this.title, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        IconButton(
            onPressed:onPressed,
            icon: Icon(
              icon,
            ))
      ],
    );
  }
}
