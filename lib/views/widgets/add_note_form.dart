import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/views/widgets/colors_view_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_note_button.dart';
import 'custom_text_field.dart';
import 'package:intl/intl.dart';


class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, body;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            maxLines: 1,
            title: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            maxLines: 7,
            title: 'Body',
            onSaved: (value) {
              body = value;
            },
          ),
          const SizedBox(height: 8,),
          const ColorsViewList(),
          const Spacer(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return AddNoteButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var formattedDate=DateFormat('dd-MM-yyyy').format(DateTime.now());
                    var noteModel = NoteModel(
                        title: title!,
                        body: body!,
                        date: formattedDate,
                        color: Colors.red.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
