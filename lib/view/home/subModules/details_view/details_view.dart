import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:task/configs/components/custom_country_code_picker.dart';
import 'package:task/utils/extensions/context_ext.dart';
import 'package:task/view/home/subModules/details_view/widget/details_card_item.dart';
import 'package:task/view/home/subModules/details_view/widget/header_widget.dart';
import 'package:task/view/home/subModules/details_view/widget/history_chart.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top section
                const HeaderWidget(),
                const SizedBox(height: 10),
                //quality section
                Row(
                  children: [
                    Text(
                      '652',
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_downward,
                                size: 14,
                                color: theme.colorScheme.onPrimary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '13%',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text('ppm',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                            ))
                      ],
                    ),
                    const Spacer(),
                    //color indicator
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/indicator.png",
                          height: 15,
                          width: 15,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 4),
                              height: 10,
                              width: 20,
                              color: Colors.purple,
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 4),
                              height: 10,
                              width: 20,
                              color: Colors.red,
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 4),
                              height: 10,
                              width: 20,
                              color: Colors.green,
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 4),
                              height: 10,
                              width: 20,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const HistoryChart(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: DetailsCardItem(
                        backgroundColor: theme.colorScheme.surface,
                        title: 'Persons',
                        subtitle: Image.asset(
                          "assets/images/persons.png",
                          height: 80,
                          width: 100,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: DetailsCardItem(
                      backgroundColor: theme.colorScheme.primary,
                      title: 'Rooms',
                      textColor: theme.colorScheme.onPrimary,
                      subtitle: Column(
                        children: [
                          Text(
                            "5",
                            style: theme.textTheme.displayLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: theme.colorScheme.onPrimary,
                            ),
                            child: Text(
                              maxLines: 1,
                              "2 of them requires action",
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          color: theme.colorScheme.onPrimary,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Plants",
                                    style: theme.textTheme.displayLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    "assets/images/leaf.png",
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                child: DetailsCardItem(
                                    title: "43",
                                    textColor: theme.colorScheme.onPrimary,
                                    backgroundColor: theme.colorScheme.primary))
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

