import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hamrahe_man_demo/theme/app_theme.dart';

class UsageCircle extends StatelessWidget {
  final String label;
  final bool active;
  final double used;
  final double total;
  final bool isDarkMode;

  const UsageCircle({
    super.key,
    required this.label,
    this.active = false,
    this.used = 0,
    this.total = 1,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    if (!active) {
      return Column(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isDarkMode ? Colors.white24 : Colors.black12,
                width: 4,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ],
      );
    }

    final percent = (used / total).clamp(0.0, 1.0);
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 44,
          lineWidth: 6,
          percent: percent,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${used.toStringAsFixed(1)}',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'گیگ باقی‌مانده',
                style: TextStyle(
                  fontSize: 8,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
              Text(
                'از ${total.toStringAsFixed(1)} گیگ',
                style: TextStyle(
                  fontSize: 8,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
            ],
          ),
          progressColor: AppTheme.brandPrimary,
          backgroundColor: isDarkMode ? Colors.white10 : Colors.black12,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
      ],
    );
  }
}
