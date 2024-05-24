import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/budget_provider.dart';

class CategorizedBoxChart extends StatelessWidget {
  final bool showNumbers;

  const CategorizedBoxChart({super.key, required this.showNumbers});

  @override
  Widget build(BuildContext context) {
    final budgetProvider = Provider.of<BudgetProvider>(context);
    final double totalBudget = budgetProvider.totalBudget;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: budgetProvider.maxBudget() + 130, // allow this to be modified based on actual budget
        
        barGroups: budgetProvider.categories.entries.map((entry) {
          return BarChartGroupData(
            x: entry.key.hashCode,
            barRods: [
              BarChartRodData(
                toY: entry.value,
                color: entry.value >= totalBudget ? Colors.red : Colors.green,
                width: 15,
                borderRadius: BorderRadius.circular(2),
                rodStackItems: [
                  BarChartRodStackItem(0, entry.value, entry.value >= totalBudget ? Color.fromARGB(255, 208, 0, 0): Color.fromARGB(255, 2, 160, 7)),
                ],
              ),
            ],
            showingTooltipIndicators: [0],
          );
        }).toList(),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              getTitlesWidget: (double value, TitleMeta meta) {
                return const Padding(
                  padding: EdgeInsets.only(top: 2.0), // Add padding to top for spacing
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: showNumbers,
              getTitlesWidget: (value, meta) {
                if (showNumbers) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0), // Add padding to left for spacing
                    child: Text(value.toString(), style: const TextStyle(fontSize: 10)),
                  );
                }
                return Container();
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false, // Remove the numbers from the top
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false, // Remove the numbers from the right
            ),
          ),
        ),
        
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: showNumbers,
          getDrawingHorizontalLine: (value) {
            if (value == totalBudget) {
              return const FlLine(  // Create a dotted line
                color: Color.fromARGB(255, 225, 96, 89),
                strokeWidth: 2,
                dashArray: [5, 5],
                 
              );
            }
            return const FlLine(
              color: Color.fromARGB(255, 158, 158, 158),
              strokeWidth: 0.5,
            );
          },
        ),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipPadding: const EdgeInsets.all(4),
            tooltipMargin: 10,
            getTooltipColor:(group) => Color.fromARGB(184, 162, 162, 162).withOpacity(0.42),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String category = budgetProvider.categories.keys
                  .firstWhere((key) => key.hashCode == group.x.toInt(), orElse: () => '');
              final isAboveBudget = rod.toY >= totalBudget;
              return BarTooltipItem(
                '${rod.toY.toString()}\n',
                TextStyle(
                  color: isAboveBudget ? Color.fromARGB(255, 208, 0, 0) : Color.fromARGB(255, 2, 160, 7),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: category,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 10,
                    ),
                  ),
                ],
              );
            },
          ),
          touchCallback: (FlTouchEvent event, barTouchResponse) {},
          handleBuiltInTouches: true,
        ),
      ),
    );
  }
}
