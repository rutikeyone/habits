import 'package:flutter/material.dart';

class DetailsDiveder extends StatelessWidget {
  const DetailsDiveder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 45,
        width: 4,
        decoration: BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
