import 'package:flutter_application_1/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  getAllNotes() {
    var box = Hive.box<NoteModel>(notesBox);
    notes = box.values.toList();
    emit(NotesSuccess());
  }
}
