import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'button.dart';

enum DateType { Today, Week, Month, Year }

class Charts extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Charts> {
  final ValueNotifier<int> _index = ValueNotifier<int>(0);

  LineChartData showChart(int index) {
    switch (index) {
      case 1:
        return weeksChart();
      case 2:
        return monthChart();
      case 3:
        return yearChart();
      default:
        return todaysChart();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonControllers controller = ButtonControllers(
        buttonsCount: 4,
        selectedIndex: 0,
        onChange: (int selectedIndex) {
          _index.value = selectedIndex;
          print('$selectedIndex');
        });
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 0, left: 0),
                    child: ValueListenableBuilder(
                      builder: (context, value, child) {
                        return LineChart(
                          showChart(_index.value),
                          swapAnimationDuration: Duration(milliseconds: 250),
                        );
                      },
                      valueListenable: _index,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ButtonStates(
                        controller: controller,
                        index: 0,
                        name: 'Today',
                      ),
                      ButtonStates(
                        controller: controller,
                        index: 1,
                        name: 'Week',
                      ),
                      ButtonStates(
                        controller: controller,
                        index: 2,
                        name: 'Month',
                      ),
                      ButtonStates(
                        controller: controller,
                        index: 3,
                        name: 'Year',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  LineChartData todaysChart() {
    return LineChartData(
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndices) {
          return spotIndices.map((spotIndex) {
            final FlSpot spot = barData.spots[spotIndex];
            if (spot.x == 0 || spot.x == 6) return null;
            return TouchedSpotIndicatorData(
              FlLine(color: Colors.grey, strokeWidth: 2, dashArray: [10, 10]),
              FlDotData(
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 8,
                    color: Color(0xffFF2D55),
                    strokeWidth: 7,
                    strokeColor: Colors.white,
                  );
                },
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white,
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final flSpot = barSpot;
                return LineTooltipItem(
                  '+ \$${flSpot.y.toInt()} \n(${flSpot.x.toInt()}%)',
                  TextStyle(color: Color(0xffFF2d55)),
                );
              }).toList();
            }),
      ),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      lineBarsData: todaysChartData(),
    );
  }

  List<LineChartBarData> todaysChartData() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(0, 200),
        FlSpot(1.9, 280),
        FlSpot(5, 200),
        FlSpot(6, 300),
        FlSpot(8, 350),
        FlSpot(9, 400),
        FlSpot(11, 300),
        FlSpot(13, 400),
      ],
      isCurved: true,
      colors: [
        Color(0xffFF2D55),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
    );

    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(0, 150),
        FlSpot(3, 280),
        FlSpot(5, 290),
        FlSpot(7, 210),
        FlSpot(10, 350),
        FlSpot(12, 260),
        FlSpot(13, 340)
      ],
      isCurved: true,
      colors: [
        Color(0xff30BC96),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
        colors: [
          Color(0x00aa4cfc),
        ],
      ),
    );

    return [
      lineChartBarData1,
      lineChartBarData2,
    ];
  }
}

LineChartData weeksChart() {
  return LineChartData(
    lineTouchData: LineTouchData(
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndices) {
        return spotIndices.map((spotIndex) {
          final FlSpot spot = barData.spots[spotIndex];
          if (spot.x == 0 || spot.x == 6) return null;
          return TouchedSpotIndicatorData(
            FlLine(color: Colors.grey, strokeWidth: 2, dashArray: [10, 10]),
            FlDotData(
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 8,
                  color: Color(0xffFF2D55),
                  strokeWidth: 7,
                  strokeColor: Colors.white,
                );
              },
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              return LineTooltipItem(
                '+ \$${flSpot.y.toInt()} \n(${flSpot.x.toInt()}%)',
                TextStyle(color: Color(0xffFF2d55)),
              );
            }).toList();
          }),
    ),
    gridData: FlGridData(show: false),
    titlesData: FlTitlesData(
      show: false,
    ),
    borderData: FlBorderData(
      show: false,
    ),
    lineBarsData: weeksChartData(),
  );
}

List<LineChartBarData> weeksChartData() {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(1, 300),
      FlSpot(1.5, 200),
      FlSpot(5, 100),
      FlSpot(7, 300),
      FlSpot(8, 230),
      FlSpot(10, 360),
      FlSpot(13, 400),
    ],
    isCurved: true,
    colors: [
      Color(0xffFF2D55),
    ],
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
  );

  final LineChartBarData lineChartBarData2 = LineChartBarData(
    spots: [
      FlSpot(1, 150),
      FlSpot(3, 280),
      FlSpot(5, 200),
      FlSpot(7, 210),
      FlSpot(9, 380),
      FlSpot(11, 260),
      FlSpot(13, 340)
    ],
    isCurved: true,
    colors: [
      Color(0xff30BC96),
    ],
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
      colors: [
        Color(0x00aa4cfc),
      ],
    ),
  );

  return [
    lineChartBarData1,
    lineChartBarData2,
  ];
}

LineChartData monthChart() {
  return LineChartData(
    lineTouchData: LineTouchData(
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndices) {
        return spotIndices.map((spotIndex) {
          final FlSpot spot = barData.spots[spotIndex];
          if (spot.x == 0 || spot.x == 6) return null;
          return TouchedSpotIndicatorData(
            FlLine(color: Colors.grey, strokeWidth: 2, dashArray: [10, 10]),
            FlDotData(
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 8,
                  color: Color(0xffFF2D55),
                  strokeWidth: 7,
                  strokeColor: Colors.white,
                );
              },
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              return LineTooltipItem(
                '+ \$${flSpot.y.toInt()} \n(${flSpot.x.toInt()}%)',
                TextStyle(color: Color(0xffFF2d55)),
              );
            }).toList();
          }),
    ),
    gridData: FlGridData(show: false),
    titlesData: FlTitlesData(
      show: false,
    ),
    borderData: FlBorderData(
      show: false,
    ),
    lineBarsData: monthChartData(),
  );
}

List<LineChartBarData> monthChartData() {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(0, 200),
      FlSpot(1.9, 280),
      FlSpot(5, 200),
      FlSpot(6, 300),
      FlSpot(8, 100),
      FlSpot(9, 400),
      FlSpot(11, 300),
      FlSpot(13, 400),
    ],
    isCurved: true,
    colors: [
      Color(0xffFF2D55),
    ],
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
  );

  final LineChartBarData lineChartBarData2 = LineChartBarData(
    spots: [
      FlSpot(0, 150),
      FlSpot(3, 280),
      FlSpot(5, 290),
      FlSpot(7, 210),
      FlSpot(8, 350),
      FlSpot(9, 260),
      FlSpot(11, 400)
    ],
    isCurved: true,
    colors: [
      Color(0xff30BC96),
    ],
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
      colors: [
        Color(0x00aa4cfc),
      ],
    ),
  );

  return [
    lineChartBarData1,
    lineChartBarData2,
  ];
}

LineChartData yearChart() {
  return LineChartData(
    lineTouchData: LineTouchData(
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndices) {
        return spotIndices.map((spotIndex) {
          final FlSpot spot = barData.spots[spotIndex];
          if (spot.x == 0 || spot.x == 6) return null;
          return TouchedSpotIndicatorData(
            FlLine(color: Colors.grey, strokeWidth: 2, dashArray: [10, 10]),
            FlDotData(
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 8,
                  color: Color(0xffFF2D55),
                  strokeWidth: 7,
                  strokeColor: Colors.white,
                );
              },
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              return LineTooltipItem(
                '+ \$${flSpot.y.toInt()} \n(${flSpot.x.toInt()}%)',
                TextStyle(color: Color(0xffFF2d55)),
              );
            }).toList();
          }),
    ),
    gridData: FlGridData(show: false),
    titlesData: FlTitlesData(
      show: false,
    ),
    borderData: FlBorderData(
      show: false,
    ),
    lineBarsData: yearChartData(),
  );
}

List<LineChartBarData> yearChartData() {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(0, 150),
      FlSpot(1.9, 260),
      FlSpot(5, 200),
      FlSpot(6, 300),
      FlSpot(7, 350),
      FlSpot(9, 400),
      FlSpot(11.5, 300),
      FlSpot(13, 400),
    ],
    isCurved: true,
    colors: [
      Color(0xffFF2D55),
    ],
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
  );

  final LineChartBarData lineChartBarData2 = LineChartBarData(
    spots: [
      FlSpot(0, 150),
      FlSpot(3, 280),
      FlSpot(4.7, 290),
      FlSpot(7, 210),
      FlSpot(10, 350),
      FlSpot(10.9, 260),
      FlSpot(13, 340)
    ],
    isCurved: true,
    colors: [
      Color(0xff30BC96),
    ],
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
      colors: [
        Color(0x00aa4cfc),
      ],
    ),
  );

  return [
    lineChartBarData1,
    lineChartBarData2,
  ];
}
