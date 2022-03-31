import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:habits/BLoC/cubit/details/details_cubit.dart';
import 'package:habits/domain/enums/details_enums.dart';
import 'package:provider/src/provider.dart';

class DropDownStatisticsButton extends StatelessWidget {
  final Map<String, StatisticsType> statisticsItemsData;
  const DropDownStatisticsButton({Key? key, required this.statisticsItemsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).dividerColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      statisticsItemsData.entries
                          .firstWhere((element) =>
                              element.value ==
                              context.read<DetailsCubit>().state.typeStatistics)
                          .key,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 32,
                      color: Theme.of(context).textTheme.headline1!.color,
                    ),
                  ],
                ),
              ),
            ),
          ),
          items: statisticsItemsData.entries
              .map((item) => DropdownMenuItem<String>(
                    value: item.key,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        item.key,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            context.read<DetailsCubit>().updateTypeStatistics(
                statisticsItemsData.entries
                    .firstWhere((element) => element.key == value)
                    .value);
          },
          buttonElevation: 2,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).dividerColor),
          dropdownElevation: 15,
          scrollbarThickness: 6,
          offset: const Offset(0, -10),
        ),
      ),
    );
  }
}
