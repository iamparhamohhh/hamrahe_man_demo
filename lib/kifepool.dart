import 'package:flutter/material.dart';

class KifePoolScreen extends StatelessWidget {
  final bool isDarkMode;

  const KifePoolScreen({super.key, required this.isDarkMode});

  Color get _backgroundColor =>
      isDarkMode ? const Color(0xFF121212) : Colors.white;

  Color get _cardColor => isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

  Color get _textColor => isDarkMode ? Colors.white : Colors.black87;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text('کیف‌پول', style: TextStyle(color: _textColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 24),
            Text(
              'تراکنش‌های اخیر',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildTransactionList(),
            const SizedBox(height: 24),
            _buildQuickActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'موجودی کیف‌پول',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '۱۵۷٬۵۰۰ ریال',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {},
                  child: const Text('شارژ کیف‌پول'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {},
                  child: const Text('برداشت'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    final transactions = [
      _Transaction(
        title: 'شارژ کیف‌پول',
        amount: '+۵۰٬۰۰۰ ریال',
        date: '۱۵ آذر ۱۴۰۳',
        type: TransactionType.deposit,
      ),
      _Transaction(
        title: 'خرید بسته اینترنت',
        amount: '-۳۰٬۰۰۰ ریال',
        date: '۱۴ آذر ۱۴۰۳',
        type: TransactionType.purchase,
      ),
      _Transaction(
        title: 'بازگشت وجه',
        amount: '+۱۰٬۰۰۰ ریال',
        date: '۱۳ آذر ۱۴۰۳',
        type: TransactionType.refund,
      ),
      _Transaction(
        title: 'شارژ کیف‌پول',
        amount: '+۱۰۰٬۰۰۰ ریال',
        date: '۱۲ آذر ۱۴۰۳',
        type: TransactionType.deposit,
      ),
      _Transaction(
        title: 'پرداخت قبض',
        amount: '-۲۳٬۰۰۰ ریال',
        date: '۱۰ آذر ۱۴۰۳',
        type: TransactionType.payment,
      ),
    ];

    return Column(
      children: transactions.map((transaction) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
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
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _getTransactionColor(
                      transaction.type,
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getTransactionIcon(transaction.type),
                    color: _getTransactionColor(transaction.type),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _textColor,
                        ),
                      ),
                      Text(
                        transaction.date,
                        style: TextStyle(
                          fontSize: 14,
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  transaction.amount,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: transaction.amount.startsWith('+')
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'عملیات سریع',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _textColor,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionButton(
                icon: Icons.add,
                title: 'شارژ',
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionButton(
                icon: Icons.send,
                title: 'انتقال',
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionButton(
                icon: Icons.history,
                title: 'تاریخچه',
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String title,
    required Color color,
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
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: _textColor,
            ),
          ),
        ],
      ),
    );
  }

  Color _getTransactionColor(TransactionType type) {
    switch (type) {
      case TransactionType.deposit:
        return Colors.green;
      case TransactionType.purchase:
        return Colors.red;
      case TransactionType.refund:
        return Colors.blue;
      case TransactionType.payment:
        return Colors.orange;
    }
  }

  IconData _getTransactionIcon(TransactionType type) {
    switch (type) {
      case TransactionType.deposit:
        return Icons.arrow_downward;
      case TransactionType.purchase:
        return Icons.shopping_cart;
      case TransactionType.refund:
        return Icons.refresh;
      case TransactionType.payment:
        return Icons.receipt;
    }
  }
}

class _Transaction {
  final String title;
  final String amount;
  final String date;
  final TransactionType type;

  _Transaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  });
}

enum TransactionType { deposit, purchase, refund, payment }
