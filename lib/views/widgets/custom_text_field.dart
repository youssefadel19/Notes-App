import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final int maxLines;
  final String title;
  final String? titleContent;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  const CustomTextField({
    super.key,
    required this.maxLines,
    required this.title,
    this.onSaved,
    this.titleContent, this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller = TextEditingController(text: widget.titleContent);

    return TextFormField(
      controller: controller,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      maxLines: widget.maxLines,
      cursorColor: const Color(0xFF56F7F7),
      decoration: InputDecoration(
          hintText: widget.title,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF56F7F7)))),
    );
  }
}
