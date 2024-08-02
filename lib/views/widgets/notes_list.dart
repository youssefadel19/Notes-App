import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/notes/cubit/notes_cubit.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/views/widgets/note_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../edit_note_view.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        //to list the notes from the new to the old
        notes = notes.reversed.toList();
        return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditNoteView(
                     note: notes[index],
                    );
                  }));
                },
                child: NotesCard(
                  note: notes[index],
                ),
              );
            });
      },
    );
  }
}
