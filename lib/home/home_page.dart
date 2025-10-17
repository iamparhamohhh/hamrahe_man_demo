import 'package:flutter/material.dart';
import 'package:hamrahe_man_demo/basteha.dart';
import 'package:hamrahe_man_demo/khadamt.dart';
import 'package:hamrahe_man_demo/kifepool.dart';
import 'package:hamrahe_man_demo/surathesab.dart';
import 'package:hamrahe_man_demo/widgets/home_service_item.dart';
import 'package:hamrahe_man_demo/widgets/usage_circle.dart';
import 'package:hamrahe_man_demo/theme/app_theme.dart';
import 'package:persian_fonts/persian_fonts.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  late final List<AnimationController> _controllers;

  final _bottomItems = const <_NavItem>[
    _NavItem(icon: Icons.home_outlined, label: 'خانه'),
    _NavItem(icon: Icons.receipt_outlined, label: 'صورت‌حساب'),
    _NavItem(icon: Icons.widgets_outlined, label: 'بسته‌ها'),
    _NavItem(icon: Icons.miscellaneous_services_outlined, label: 'خدمات'),
    _NavItem(icon: Icons.account_balance_wallet_outlined, label: 'کیف‌پول'),
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      _bottomItems.length,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
      ),
    );
    _controllers[_selectedIndex].value = 1.0;
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onNavTap(int i) {
    if (i == _selectedIndex) return;
    _controllers[_selectedIndex].reverse();
    _controllers[i].forward();
    setState(() => _selectedIndex = i);
  }

  Widget _getCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return SuratHesabScreen(isDarkMode: widget.isDarkMode);
      case 2:
        return BastehaScreen(isDarkMode: widget.isDarkMode);
      case 3:
        return KhadamatScreen(isDarkMode: widget.isDarkMode);
      case 4:
        return KifePoolScreen(isDarkMode: widget.isDarkMode);
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    final Color cardColor = widget.isDarkMode
        ? const Color(0xFF1E1E1E)
        : Colors.white;
    final Color textColor = widget.isDarkMode ? Colors.white : Colors.black87;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          const SizedBox(height: 25),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: UsageCircle(
                    label: 'مکالمه',
                    active: false,
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: UsageCircle(
                    label: 'اینترنت',
                    active: true,
                    used: 22.1,
                    total: 40.04,
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: UsageCircle(
                    label: 'پیامک',
                    active: false,
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: widget.isDarkMode
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      elevation: 6,
                      shadowColor: Colors.black.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'جزئیات و پرداخت',
                      style: PersianFonts.Samim.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  // child: Row(
                  //   children: [
                  //     ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: AppTheme.brandPrimary,
                  //         foregroundColor: Colors.white,
                  //       ),
                  //       onPressed: () {},
                  //       child: Text(
                  //         'جزئیات و پرداخت',
                  //         style: PersianFonts.Samim.copyWith(color: Colors.white),
                  //       ),
                  //     ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'صورت‌حساب میان‌دوره:',
                        style: PersianFonts.Samim.copyWith(
                          fontSize: 14,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '۲۳٬۰۰۰ ریال',
                        style: PersianFonts.Samim.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'خدمات پُرکاربرد',
                  style: PersianFonts.Samim.copyWith(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      HomeServiceItem(
                        label: 'اربعین',
                        icon: Icons.flag,
                        highlight: true,
                        isDarkMode: widget.isDarkMode,
                      ),
                      HomeServiceItem(
                        label: 'تشویقی',
                        icon: Icons.thumb_up,
                        isDarkMode: widget.isDarkMode,
                      ),
                      HomeServiceItem(
                        label: 'بسته ساعتی',
                        icon: Icons.access_time,
                        isDarkMode: widget.isDarkMode,
                      ),
                      HomeServiceItem(
                        label: 'اینترنت',
                        icon: Icons.wifi,
                        isDarkMode: widget.isDarkMode,
                      ),
                      HomeServiceItem(
                        label: 'خدمات شارژ',
                        icon: Icons.bolt,
                        isDarkMode: widget.isDarkMode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode
          ? const Color(0xFF121212)
          : Colors.white,
      appBar: AppBar(
        //centerTitle: true,
          title: SizedBox(
            height: 32,
            child: Image.asset(
              'assets/arka.png',
              height: 150,
              width: 200,
              fit: BoxFit.fitHeight,
              // Show a fallback if the asset fails to load so we can debug quickly
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
            ),
          ),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: _getCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
        items: List.generate(_bottomItems.length, (i) {
          return BottomNavigationBarItem(
            icon: Icon(_bottomItems[i].icon),
            label: _bottomItems[i].label,
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
