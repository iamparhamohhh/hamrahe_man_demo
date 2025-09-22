import 'package:flutter/material.dart';

class KhadamatScreen extends StatelessWidget {
  final bool isDarkMode;

  const KhadamatScreen({super.key, required this.isDarkMode});

  Color get _backgroundColor =>
      isDarkMode ? const Color(0xFF121212) : Colors.white;

  Color get _cardColor => isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

  Color get _textColor => isDarkMode ? Colors.white : Colors.black87;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text('خدمات', style: TextStyle(color: _textColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'خدمات پرکاربرد',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 20),
            _buildServiceGrid(),
            const SizedBox(height: 32),
            Text(
              'خدمات ویژه',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildSpecialServices(),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceGrid() {
    final services = [
      _ServiceItem(
        title: 'شارژ مستقیم',
        icon: Icons.bolt,
        color: Colors.orange,
        description: 'شارژ آنی سیم‌کارت',
      ),
      _ServiceItem(
        title: 'اینترنت',
        icon: Icons.wifi,
        color: Colors.blue,
        description: 'خرید بسته اینترنت',
      ),
      _ServiceItem(
        title: 'مکالمه',
        icon: Icons.phone,
        color: Colors.green,
        description: 'بسته مکالمه',
      ),
      _ServiceItem(
        title: 'پیامک',
        icon: Icons.message,
        color: Colors.purple,
        description: 'بسته پیامک',
      ),
      _ServiceItem(
        title: 'خدمات رومینگ',
        icon: Icons.language,
        color: Colors.red,
        description: 'خدمات بین‌الملل',
      ),
      _ServiceItem(
        title: 'مشاوره',
        icon: Icons.support_agent,
        color: Colors.teal,
        description: 'پشتیبانی ۲۴ ساعته',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return _buildServiceCard(services[index]);
      },
    );
  }

  Widget _buildServiceCard(_ServiceItem service) {
    return Container(
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: service.color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(service.icon, size: 32, color: service.color),
                ),
                const SizedBox(height: 8),
                Text(
                  service.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: _textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  service.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialServices() {
    final specialServices = [
      _SpecialService(
        title: 'خدمات اربعین',
        description: 'بسته‌های ویژه اربعین',
        icon: Icons.flag,
        isNew: true,
      ),
      _SpecialService(
        title: 'تشویقی',
        description: 'جوایز و هدایا',
        icon: Icons.card_giftcard,
        isNew: false,
      ),
      _SpecialService(
        title: 'خدمات سازمانی',
        description: 'برای شرکت‌ها و سازمان‌ها',
        icon: Icons.business,
        isNew: false,
      ),
    ];

    return Column(
      children: specialServices.map((service) {
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
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(service.icon, color: Colors.orange, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            service.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _textColor,
                            ),
                          ),
                          if (service.isNew) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'جدید',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      Text(
                        service.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_left,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ServiceItem {
  final String title;
  final IconData icon;
  final Color color;
  final String description;

  _ServiceItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
  });
}

class _SpecialService {
  final String title;
  final String description;
  final IconData icon;
  final bool isNew;

  _SpecialService({
    required this.title,
    required this.description,
    required this.icon,
    required this.isNew,
  });
}
