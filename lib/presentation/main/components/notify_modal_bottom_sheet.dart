import 'package:flutter/material.dart';

Widget showNotifyModalBottomSheet({
  required BuildContext context,
  required String title,
  required String text,
  required Widget icon,
  required Function()? closeOnPreseed,
}) {
  return Container(
    child: Wrap(
      alignment: WrapAlignment.center,
      children: [
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 24, height: 24),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color:
                                  Theme.of(context).textTheme.headline3!.color,
                              borderRadius: BorderRadius.circular(20)),
                          child: IconButton(
                            iconSize: 20,
                            onPressed: closeOnPreseed,
                            color: Theme.of(context).textTheme.headline1!.color,
                            icon: const Icon(Icons.close),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    icon,
                    const SizedBox(height: 15),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
