// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WorkoutReport extends StatefulWidget {
  const WorkoutReport({Key? key}) : super(key: key);

  @override
  State<WorkoutReport> createState() => _WorkoutReportState();
}

class _WorkoutReportState extends State<WorkoutReport>
    with TickerProviderStateMixin {
  List<Map<String, dynamic>> dates = [
    {
      "dates": "01",
      "day": "Mon",
    },
    {
      "dates": "02",
      "day": "Tue",
    },
    {
      "dates": "03",
      "day": "Wed",
    },
    {
      "dates": "04",
      "day": "Thu",
    },
    {
      "dates": "05",
      "day": "Fri",
    },
    {
      "dates": "06",
      "day": "Sat",
    },
    {
      "dates": "07",
      "day": "Sun",
    }
  ];

  late final TabController _controller = TabController(
    length: 4,
    vsync: this,
  );

  List<double> newReports = [6, 4, 4.8, 7, 8, 5.5, 6, 6.8, 7, 8, 8];
  List<double> calories = [7, 4.2, 3.8, 7.8, 8, 7, 4, 6.7, 6.3, 7.5, 7];
  List<double> workout = [6.5, 4, 5, 8.3, 9.5, 6.8, 5.2, 6, 6.2, 8, 7];
  List<double> heart = [6, 4.5, 4, 8, 9, 6, 5, 6.5, 6, 7, 7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 15, 15),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            margin: const EdgeInsets.all(18.0),
            // color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Hi,Ducky",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.calendar_today,
                      size: 18,
                    ),
                  ],
                ),
                dateCapsules(),
                Text(
                  "Today's Report",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: Colors.grey,
            overlayColor: MaterialStateProperty.all(
                Colors.transparent), // -> remove glitching effect
            controller: _controller,
            tabs: [
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  color: Colors.grey.shade800,
                  dashPattern: [3, 3],
                  child: rotatedTabBars(Icons.add_circle,
                      "New Report")), // -> one with dotted container
              rotatedTabBars(Icons.local_fire_department, "Calories"),
              rotatedTabBars(Icons.fitness_center, "Workout"),
              rotatedTabBars(Icons.favorite, "Heart Rate"),
            ],
          ),
          Container(
            height: 280,
            color: Colors.black,
            child: TabBarView(
              controller: _controller,
              children: [
                lineChartReports(newReports),
                lineChartReports(calories),
                lineChartReports(workout),
                lineChartReports(heart),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget lineChartReports(List report) => LineChart(
        LineChartData(
          minX: 0,
          minY: 0,
          maxX: 10,
          maxY: 12,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, report[0]),
                FlSpot(1, report[1]),
                FlSpot(2, report[2]),
                FlSpot(3, report[3]),
                FlSpot(4, report[4]),
                FlSpot(5, report[5]),
                FlSpot(6, report[6]),
                FlSpot(7, report[7]),
                FlSpot(8, report[8]),
                FlSpot(9, report[9]),
                FlSpot(10, report[10]),
              ],
              isCurved: true,
              gradient: const LinearGradient(
                colors: [
                  Colors.yellow,
                  Colors.orange,
                  Colors.green,
                  Colors.teal,
                ],
              ),
              dotData: FlDotData(show: false),
              barWidth: 3,
            ),
          ],
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    String text = "";

                    switch (value.toInt()) {
                      case 1:
                        text = "20";
                        break;
                      case 3:
                        text = "40";
                        break;
                      case 5:
                        text = "60";
                        break;
                      case 7:
                        text = "80";
                        break;
                      case 9:
                        text = "100";
                        break;
                      case 11:
                        text = "120";
                        break;
                    }

                    return Text(
                      text,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    );
                  }),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    String text = "";

                    switch (value.toInt()) {
                      case 0:
                        text = "1.00";
                        break;
                      case 1:
                        text = "2.00";
                        break;
                      case 2:
                        text = "3.00";
                        break;
                      case 3:
                        text = "4.00";
                        break;
                      case 4:
                        text = "5.00";
                        break;
                      case 5:
                        text = "6.00";
                        break;
                      case 6:
                        text = "7.00";
                        break;
                      case 7:
                        text = "8.00";
                        break;
                      case 8:
                        text = "9.00";
                        break;
                      case 9:
                        text = "10.00";
                        break;
                      case 10:
                        text = "11.00";
                        break;
                    }

                    return Text(
                      text,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    );
                  }),
            ),
          ),
        ),
      );

  Widget rotatedTabBars(IconData icon, String text) => RotatedBox(
        quarterTurns: 3,
        child: Container(
          height: 60,
          width: 135,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ),
      );

  Widget dateCapsules() => Container(
        height: 70,
        // color: Colors.yellow,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dates.length,
          itemBuilder: (context, index) {
            final date = dates[index];
            return Container(
              width: 50,
              height: 70,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                  bottom: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    date["dates"],
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    date["day"],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
