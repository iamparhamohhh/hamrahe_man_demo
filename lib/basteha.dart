import 'package:flutter/material.dart';

class BastehaScreen extends StatelessWidget {
  final bool isDarkMode;

  const BastehaScreen({super.key, required this.isDarkMode});

  Color get _backgroundColor =>
      isDarkMode ? const Color(0xFF121212) : Colors.white;

  Color get _cardColor => isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

  Color get _textColor => isDarkMode ? Colors.white : Colors.black87;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text('بسته‌ها', style: TextStyle(color: _textColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'بسته‌های اینترنت',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 20),
            _buildPackageCard(
              title: 'بسته ۱۰ گیگابایت',
              price: '۵۰٬۰۰۰ ریال',
              duration: '۳۰ روز',
              data: '۱۰ GB',
              remaining: '8.5 GB',
              isActive: true,
            ),
            const SizedBox(height: 16),
            _buildPackageCard(
              title: 'بسته نامحدود شبانه',
              price: '۳۰٬۰۰۰ ریال',
              duration: '۳۰ روز',
              data: 'نامحدود (۲۳-۷)',
              remaining: 'فعال',
              isActive: true,
            ),
            const SizedBox(height: 16),
            _buildPackageCard(
              title: 'بسته ۵ گیگابایت',
              price: '۳۰٬۰۰۰ ریال',
              duration: '۳۰ روز',
              data: '۵ GB',
              remaining: 'تمام شده',
              isActive: false,
            ),
            const SizedBox(height: 32),
            Text(
              'بسته‌های مکالمه',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildPackageCard(
              title: 'بسته ۲۰۰ دقیقه',
              price: '۲۰٬۰۰۰ ریال',
              duration: '۳۰ روز',
              data: '۲۰۰ دقیقه',
              remaining: '۱۵۰ دقیقه',
              isActive: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageCard({
    required String title,
    required String price,
    required String duration,
    required String data,
    required String remaining,
    required bool isActive,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isDarkMode
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _textColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isActive ? 'فعال' : 'غیرفعال',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مبلغ: $price',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  ),
                  Text(
                    'مدت: $duration',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    data,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  ),
                  Text(
                    'باقی‌مانده: $remaining',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isActive ? Colors.orange : Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {},
                  child: Text(
                    isActive ? 'تمدید' : 'خرید',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
