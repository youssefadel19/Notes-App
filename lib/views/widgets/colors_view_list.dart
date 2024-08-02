import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/cubits/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.notecolor});
  final bool isActive;
  final Color notecolor;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 32,
            child: CircleAvatar(
              backgroundColor: notecolor,
              radius: 28,
            ),
          )
        : CircleAvatar(
            backgroundColor: notecolor,
            radius: 32,
          );
  }
}

class ColorsViewList extends StatefulWidget {
  const ColorsViewList({super.key});

  @override
  State<ColorsViewList> createState() => _ColorsViewListState();
}

class _ColorsViewListState extends State<ColorsViewList> {
  int currentIndex = 0;
  List<Color> colors = noteColors;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          itemCount: noteColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color=colors[index];
                  setState(() {});
                },
                child: ColorItem(
                  notecolor: colors[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
