import 'package:flutter/material.dart';

class CircularProgressIndicatorWithPercentage extends StatelessWidget {
  final double percentage; // value between 0 and 100

  const CircularProgressIndicatorWithPercentage({
    super.key,
    required this.percentage,
  });

  Color _getProgressColor(double percentage, BuildContext context) {
    if (percentage == 0) {
      // Not rated
      return Colors.transparent;
    }

    if(percentage.abs() < 1e-2) {
      return Theme.of(context).primaryColorLight; // Near perfect
    } else if (percentage >= 61.8) {
      return Colors.green; // High score
    } else if (percentage >= 23.6) {
      return Colors.yellow; // Medium score
    } else {
      return Colors.red; // Low score
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 40, // Adjust size
          height: 40,
          child: CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 4,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(_getProgressColor(percentage, context)),
          ),
        ),
        Text(
          percentage==0 ? "N/A" : "${percentage.toInt()}%",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: _getProgressColor(percentage, context),
          ),
        ),
      ],
    );
  }
}
