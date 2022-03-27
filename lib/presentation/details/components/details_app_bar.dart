import 'package:flutter/material.dart';

class DetailsAppBar extends StatelessWidget {
  final String title;

  const DetailsAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            iconSize: 26,
            color: Theme.of(context).textTheme.headline1!.color,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ),
          IconButton(
              iconSize: 26,
              color: Theme.of(context).textTheme.headline1!.color,
              icon: const Icon(Icons.edit),
              onPressed: () => {}),
        ],
      ),
    );
  }
}
