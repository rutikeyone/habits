import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final bool isSelected;

  const ColorItem({
    Key? key,
    required this.color,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: isSelected
            ? Icon(
                FontAwesomeIcons.check,
                size: 20,
                color: Theme.of(context).textTheme.headline2!.color,
              )
            : null,
      ),
      onTap: onTap,
    );
  }
}
