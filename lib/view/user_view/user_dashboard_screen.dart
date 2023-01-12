import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Portfolio"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    // padding: EdgeInsets.symmetric(vertical: 20),
                    height: size.height / 2.35,
                    width: double.infinity,
                    color: Colors.white,
                    child: SfCircularChart(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      // title: ChartTitle(text: 'continent wise gdp'),
                      legend: Legend(
                          position: LegendPosition.bottom,
                          isResponsive: true,
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap),
                      tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries>[
                        DoughnutSeries<GDPData, String>(
                            dataSource: _chartData,
                            xValueMapper: ((GDPData data, _) => data.continent),
                            yValueMapper: ((GDPData data, _) => data.gdp),
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true),
                            enableTooltip: true)
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: size.height / 2.35,
                    height: 800,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Total', 20000),
      GDPData('Attended', 5000),
      GDPData('Pending', 3000),
      GDPData('resolved', 12000),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
