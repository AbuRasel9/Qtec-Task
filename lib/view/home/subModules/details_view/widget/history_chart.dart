import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:task/utils/extensions/context_ext.dart';

class HistoryChart extends StatelessWidget {
  const HistoryChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'History',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(
                  .5,
                ),
              ),
            ),
            Text(
              'See all',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(
                  .5,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: true),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: theme.colorScheme.onSurface.withOpacity(
                    .2,
                  ),
                ),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      const titles = [
                        'Oct\n24',
                        'Nov\n24',
                        'Dec\n24',
                        'Jan\n25',
                        'Feb\n25',
                        'Mar\n25',
                        'Apr\n25'
                      ];
                      return Text(titles[value.toInt()]);
                    },
                    interval: 1,
                    reservedSize: 35,
                  ),
                ),
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  color: theme.colorScheme.primary,
                  barWidth: 2,
                  dotData: const FlDotData(show: true),
                  spots: const [
                    FlSpot(0, 4),
                    FlSpot(1, 6),
                    FlSpot(2, 8),
                    FlSpot(3, 6),
                    FlSpot(4, 6.5),
                    FlSpot(5, 7),
                    FlSpot(6, 3),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
