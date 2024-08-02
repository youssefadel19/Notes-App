import 'package:flutter/material.dart';

const notesBox = 'notes_box';

const List<Color> noteColors = [
  Color(0xFF503c4f),
  Color(0xFF61876d),
  Color(0xFFe2b954),
  Color(0xFFf7dc8b),
  Color(0xFF8bba95),
  Color(0xFFba293e),
  Color(0xFF7f6040),
];

const SnackBar snackBar = SnackBar(
  content: Text(
    'Note Saved',
    style: TextStyle(color: Colors.white),
  ),
  backgroundColor: Colors.black12,
);
