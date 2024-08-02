import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:flutter_application_1/cubits/notes/cubit/notes_cubit.dart';
import 'package:flutter_application_1/views/widgets/add_note_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).getAllNotes();
            Navigator.pop(context);
          }
          if (state is AddNoteFailure) {
            debugPrint('error ${state.errorMsg}');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                    ),
                child: const AddNoteForm()),
          );
        },
      ),
    );
  }
}
