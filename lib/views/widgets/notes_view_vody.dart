import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/notes/cubit/notes_cubit.dart';
import 'package:flutter_application_1/views/widgets/custom_appbar.dart';
import 'package:flutter_application_1/views/widgets/notes_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8, left: 24, right: 20),
        child: Column(
          children: [
            CustomAppBar(
              title: "Notes",
            ),
            Expanded(
              child: NotesList(),
            ),
          ],
        ),
      ),
    );
  }
}
