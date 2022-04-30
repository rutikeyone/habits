import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits/core/BLoC/cubit/details/details_cubit.dart';
import 'package:habits/core/domain/enums/details_enums.dart';
import 'package:habits/core/domain/model/habit.dart';
import '../widgets/chart/detail_line_chart.dart';
import 'package:habits/presentation/widgets/show_cupertino_dialog.dart'
    as cupertinoDialog;
import '../../generated/l10n.dart';
import 'components/details_app_bar.dart';
import 'components/header_details.dart';
import '../widgets/details_divider.dart';
import '../widgets/details_text_item.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Habit habit = ModalRoute.of(context)?.settings.arguments as Habit;
    final _now = DateTime.now();
    final double _percent = habit.totalDays.isNotEmpty
        ? habit.completedDays.length / habit.totalDays.length
        : 0;
    final int _percemtMonth = habit.totalDays.isNotEmpty
        ? ((habit.completedDays
                        .where((element) => element.month == _now.month)
                        .toList()
                        .length /
                    habit.totalDays
                        .where((element) => element.month == _now.month)
                        .toList()
                        .length) *
                100)
            .toInt()
        : 0;
    final Map<String, StatisticsType> statisticsItemsData = {
      S.of(context).for_the_current_year: StatisticsType.theCurrentYear,
      S.of(context).last_year: StatisticsType.theLastYear,
      S.of(context).over_the_past_three_years: StatisticsType.theLastThreeYear,
    };

    return SafeArea(
      child: BlocBuilder<DetailsCubit, DetailsState>(builder: (context, state) {
        if (state is DetailsViewState) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColorDark,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  DetailsAppBar(
                    title: habit.title,
                  ),
                  const SizedBox(height: 10),
                  HeaderDetails(habit: habit),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircularPercentIndicator(
                                percent: _percent,
                                lineWidth: 5.0,
                                radius: 30.0,
                                center: Text(
                                  _percent.toStringAsFixed(1),
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                progressColor: Theme.of(context).indicatorColor,
                              ),
                              const SizedBox(width: 20),
                              Row(
                                children: [
                                  DetailsTextItem(
                                    bodyText: habit.totalDays.length.toString(),
                                    bottomText: S.of(context).times,
                                  ),
                                  const DetailsDiveder(),
                                  DetailsTextItem(
                                      bodyText:
                                          habit.completedDays.length.toString(),
                                      bottomText: S.of(context).done_1),
                                  const DetailsDiveder(),
                                  DetailsTextItem(
                                      bodyText: _percemtMonth.toString() + "%",
                                      bottomText: S.of(context).month),
                                  const DetailsDiveder(),
                                  DetailsTextItem(
                                      bodyText:
                                          (_percent * 100).toStringAsFixed(0) +
                                              "%",
                                      bottomText: S.of(context).total),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(18),
                        ),
                        color: Theme.of(context).primaryColorLight,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 15, left: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 10,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      S.of(context).statistics,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(fontSize: 20),
                                    ),
                                  ),
                                ),
                                const Flexible(flex: 1, child: SizedBox()),
                                Flexible(
                                  flex: 10,
                                  child: SizedBox(
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          cupertinoDialog.showCupertinoDialog(
                                        context: context,
                                        title: Text(S.of(context).chart),
                                        items: statisticsItemsData.entries
                                            .map(
                                              (e) => CupertinoDialogAction(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Text(
                                                    e.key,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<DetailsCubit>()
                                                      .updateTypeStatistics(
                                                        e.value,
                                                      );
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            )
                                            .toList(),
                                      ),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Theme.of(context).dividerColor),
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            statisticsItemsData.entries
                                                .firstWhere((element) =>
                                                    element.value ==
                                                    context
                                                        .watch<DetailsCubit>()
                                                        .statisticsType)
                                                .key,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                ?.copyWith(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          getLineChartWithStatisticsType(context, habit),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}

Widget getLineChartWithStatisticsType(BuildContext context, Habit habit) {
  final DetailsViewState? _viewState =
      context.read<DetailsCubit>().state as DetailsViewState;
  if (_viewState != null) {
    switch (_viewState.typeStatistics) {
      case StatisticsType.theCurrentYear:
        return DetailLineChart(
          context: context,
          spots: context
              .read<DetailsCubit>()
              .getFlSpotsDataForTheCurrentYear(habit),
        );
      case StatisticsType.theLastYear:
        return DetailLineChart(
          context: context,
          spots: context.read<DetailsCubit>().getFlSpotsDataLastYear(habit),
        );
      case StatisticsType.theLastThreeYear:
        return DetailLineChart(
          context: context,
          spots: context
              .read<DetailsCubit>()
              .getFlSpotsDataForThePastThreeYears(habit),
        );
    }
  }
  return Container();
}
