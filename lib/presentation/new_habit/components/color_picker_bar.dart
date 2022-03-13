import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/presentation/state/new_habit/new_habit_bloc.dart';
import 'package:habits/presentation/state/new_habit/new_habit_event.dart';
import 'package:habits/presentation/theme/auxilary_color.dart';
import 'package:habits/presentation/widgets/color_item.dart';

class ColorPickerBar extends StatefulWidget {
  const ColorPickerBar({Key? key}) : super(key: key);

  @override
  State<ColorPickerBar> createState() => _ColorPickerBarState();
}

class _ColorPickerBarState extends State<ColorPickerBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 50,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colorItems.length,
            itemBuilder: (builder, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ColorItem(
                color: colorItems[index].value1,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  BlocProvider.of<NewHabitBloc>(context).add(
                    ColorChangedEvent(
                      unselectedColor: colorItems[selectedIndex].value1,
                      selectedColor: colorItems[selectedIndex].value2,
                    ),
                  );
                },
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
