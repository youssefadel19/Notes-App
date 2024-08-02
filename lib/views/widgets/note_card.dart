import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/notes/cubit/notes_cubit.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
          height: 160,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    note.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    note.body,
                    style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      _showAlertDialoug(context);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 16),
                child: Text(
                  note.date,
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.4)),
                ),
              )
            ],
          )),
    );
  }

  void _showAlertDialoug(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Deletion'),
            content: const Text('Are you sure you want to delete this item?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    BlocProvider.of<NotesCubit>(context).getAllNotes();
                  },
                  child: const Text('No')),
              TextButton(
                  onPressed: () {
                    note.delete();
                    Navigator.pop(context);
                    BlocProvider.of<NotesCubit>(context).getAllNotes();
                  },
                  child: const Text('Yes')),
            ],
          );
        });
  }
}
