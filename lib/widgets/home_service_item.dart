import 'package:flutter/material.dart';

class HomeServiceItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool highlight;
  final bool isDarkMode;

  const HomeServiceItem({
    super.key,
    required this.label,
    required this.icon,
    this.highlight = false,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: 72,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isDarkMode
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: highlight
                      ? const Color(0xFF33B4E6)
                      : (isDarkMode ? Colors.white : Colors.black87),
                ),
                if (highlight)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF33B4E6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'ویژه',
                        style: TextStyle(fontSize: 8, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            const Spacer(),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
