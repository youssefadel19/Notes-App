import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:hive_flutter/adapters.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color? color= const Color(0xFF503c4f);

  addNote(NoteModel note) async {
    note.color=color!.value;
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>(notesBox);
      await box.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errorMsg: e.toString()));
    }
  }
}
