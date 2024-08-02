import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/views/widgets/custom_appbar.dart';
import 'package:flutter_application_1/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 24, right: 20),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.body = content ?? widget.note.body;
              widget.note.save();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
            maxLines: 1,
            title: 'Title',
            titleContent: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
            maxLines: 9,
            title: 'Title',
            titleContent: widget.note.body,
            onChanged: (value) {
              content = value;
            },
          )
        ],
      ),
    )));
  }
}
