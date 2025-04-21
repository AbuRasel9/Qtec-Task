import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 10),
              _buildAirQualityInfo(),
              const SizedBox(height: 20),
              _buildHistoryChart(),
              const SizedBox(height: 20),
              _buildSummaryBoxes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.home, size: 32, color: Colors.green),
        const SizedBox(width: 10),
        const Text('Home', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text('Good', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  Widget _buildAirQualityInfo() {
    return Row(
      children: [
        const Text('652', style: TextStyle(fontSize: 48, color: Colors.green, fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.arrow_downward, size: 14, color: Colors.white),
                  SizedBox(width: 4),
                  Text('13%', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 4),
            const Text('ppm', style: TextStyle(color: Colors.green, fontSize: 16))
          ],
        )
      ],
    );
  }

  Widget _buildHistoryChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('See all', style: TextStyle(color: Colors.grey))
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: true),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      const titles = ['Oct\n24', 'Nov\n24', 'Dec\n24', 'Jan\n25', 'Feb\n25', 'Mar\n25', 'Apr\n25'];
                      return Text(titles[value.toInt()]);
                    },
                    interval: 1,
                    reservedSize: 30,
                  ),
                ),
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  color: Colors.green,
                  barWidth: 2,
                  dotData: FlDotData(show: true),
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

  Widget _buildSummaryBoxes() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.3,
        children: [
          _buildBox('Persons', [
            CircleAvatar(backgroundImage: AssetImage('assets/p1.png'), radius: 16),
            CircleAvatar(backgroundImage: AssetImage('assets/p2.png'), radius: 16),
            CircleAvatar(backgroundImage: AssetImage('assets/p3.png'), radius: 16),
            CircleAvatar(child: Text('+2'), radius: 16, backgroundColor: Colors.grey[300]),
          ]),
          _buildBox('Rooms', [
            const Text('5', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
            const Text('2 of them requires action', style: TextStyle(fontSize: 12, color: Colors.white)),
          ], color: Colors.green),
          _buildBox('Plants', [
            const Icon(Icons.eco, size: 32, color: Colors.green),
            const Text('43', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ]),
        ],
      ),
    );
  }

  Widget _buildBox(String title, List<Widget> children, {Color? color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color != null ? Colors.white : Colors.black)),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}
