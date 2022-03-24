import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  final String text;
  final IconData icon;
  const HeaderItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).textTheme.headline1!.color,
                  size: 26,
                ),
                const SizedBox(width: 5),
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
