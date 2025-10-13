import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';

class SuratHesabScreen extends StatelessWidget {
  final bool isDarkMode;

  const SuratHesabScreen({super.key, required this.isDarkMode});

  Color get _backgroundColor =>
      isDarkMode ? const Color(0xFF121212) : Colors.white;

  Color get _cardColor => isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

  Color get _textColor => isDarkMode ? Colors.white : Colors.black87;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text(
          'صورت‌حساب',
          style: PersianFonts.Samim.copyWith(color: _textColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'صورت‌حساب‌های من',
              style: PersianFonts.Samim.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 20),
            _buildBillCard(
              title: 'صورت‌حساب میان‌دوره',
              amount: '۲۳٬۰۰۰ ریال',
              date: '۱۵ آذر ۱۴۰۳',
              status: 'پرداخت نشده',
              isPaid: false,
            ),
            const SizedBox(height: 16),
            _buildBillCard(
              title: 'صورت‌حساب پایان دوره',
              amount: '۴۵٬۰۰۰ ریال',
              date: '۱ آذر ۱۴۰۳',
              status: 'پرداخت شده',
              isPaid: true,
            ),
            const SizedBox(height: 16),
            _buildBillCard(
              title: 'صورت‌حساب جاری',
              amount: '۱۲٬۵۰۰ ریال',
              date: 'در حال محاسبه',
              status: 'در انتظار',
              isPaid: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillCard({
    required String title,
    required String amount,
    required String date,
    required String status,
    required bool isPaid,
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
                  color: isPaid ? Colors.green : const Color(0xFF33B4E6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'مبلغ: $amount',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'تاریخ: $date',
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? Colors.white70 : Colors.black54,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPaid
                        ? Colors.grey
                        : const Color(0xFF33B4E6),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {},
                  child: Text(
                    isPaid ? 'مشاهده جزئیات' : 'پرداخت',
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
