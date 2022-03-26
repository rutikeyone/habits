import 'package:flutter/material.dart';

import '../../inherit/new_habit_widget_provider.dart';
import '../../theme/auxilary_color.dart';
import '../../widgets/color_item.dart';

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
                  NewHabitWidgetProvider.of(context)?.unselectedColor =
                      colorItems[selectedIndex].value1;
                  NewHabitWidgetProvider.of(context)?.selectedColor =
                      colorItems[selectedIndex].value2;
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
