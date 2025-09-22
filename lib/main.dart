import 'package:flutter/material.dart';
import 'package:hamrahe_man_demo/basteha.dart';
import 'package:hamrahe_man_demo/khadamt.dart';
import 'package:hamrahe_man_demo/kifepool.dart';
import 'package:hamrahe_man_demo/surathesab.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  ThemeData _getLightTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black87),
        bodyMedium: TextStyle(color: Colors.black54),
      ),
      colorScheme: const ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.orange,
        surface: Colors.white,
        onSurface: Colors.black87,
      ),
    );
  }

  ThemeData _getDarkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Colors.blueAccent,
        secondary: Colors.orangeAccent,
        surface: Color(0xFF1E1E1E),
        onSurface: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example UI',
      debugShowCheckedModeBanner: false,
      theme: _getLightTheme(),
      darkTheme: _getDarkTheme(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(isDarkMode: _isDarkMode, onToggleTheme: _toggleTheme),
      ),
    );
  }
}

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

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final _bottomItems = <_NavItem>[
    _NavItem(icon: Icons.home, label: 'خانه'),
    _NavItem(icon: Icons.receipt, label: 'صورت‌حساب'),
    _NavItem(icon: Icons.widgets, label: 'بسته‌ها'),
    _NavItem(icon: Icons.miscellaneous_services, label: 'خدمات'),
    _NavItem(icon: Icons.account_balance_wallet, label: 'کیف‌پول'),
  ];

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
    Color _backgroundColor = widget.isDarkMode
        ? const Color(0xFF121212)
        : Colors.white;

    Color _cardColor = widget.isDarkMode
        ? const Color(0xFF1E1E1E)
        : Colors.white;

    Color _textColor = widget.isDarkMode ? Colors.white : Colors.black87;

    Color _subTextColor = widget.isDarkMode ? Colors.white70 : Colors.black54;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          // Top stories row
          SizedBox(height: 25),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _StoryItem(
                  label: ' اربعین',
                  icon: Icons.call,
                  isDarkMode: widget.isDarkMode,
                ),
                _StoryItem(
                  label: 'درگاه مشتریان',
                  icon: Icons.cloud_queue,
                  isDarkMode: widget.isDarkMode,
                ),
                _StoryItem(
                  label: 'اینترنت',
                  icon: Icons.wifi,
                  isDarkMode: widget.isDarkMode,
                ),
                _StoryItem(
                  label: 'شارژ',
                  icon: Icons.bolt,
                  isDarkMode: widget.isDarkMode,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Usage cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _UsageCircle(
                    label: 'مکالمه',
                    active: false,
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _UsageCircle(
                    label: 'اینترنت',
                    active: true,
                    used: 22.1,
                    total: 40.04,
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _UsageCircle(
                    label: 'پیامک',
                    active: false,
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Mid-period bill
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _cardColor,
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
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('جزئیات و پرداخت'),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'صورت‌حساب میان‌دوره:',
                        style: TextStyle(fontSize: 14, color: _textColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '۲۳٬۰۰۰ ریال',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Services row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'خدمات پُرکاربرد',
                  style: TextStyle(fontSize: 16, color: _textColor),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _ServiceItem(
                        label: 'اربعین',
                        icon: Icons.flag,
                        highlight: true,
                        isDarkMode: widget.isDarkMode,
                      ),
                      _ServiceItem(
                        label: 'تشویقی',
                        icon: Icons.thumb_up,
                        isDarkMode: widget.isDarkMode,
                      ),
                      _ServiceItem(
                        label: 'بسته ساعتی',
                        icon: Icons.access_time,
                        isDarkMode: widget.isDarkMode,
                      ),
                      _ServiceItem(
                        label: 'اینترنت',
                        icon: Icons.wifi,
                        isDarkMode: widget.isDarkMode,
                      ),
                      _ServiceItem(
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
      body: _getCurrentScreen(),

      // Bottom navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: widget.isDarkMode
            ? const Color(0xFF1E1E1E)
            : Colors.white,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: widget.isDarkMode
            ? Colors.white70
            : Colors.black54,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: _bottomItems
            .map(
              (e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label),
            )
            .toList(),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}

class _StoryItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isDarkMode;

  const _StoryItem({
    required this.label,
    required this.icon,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Colors.orange, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(icon, color: Colors.white, size: 32),
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
      ),
    );
  }
}

class _UsageCircle extends StatelessWidget {
  final String label;
  final bool active;
  final double used;
  final double total;
  final bool isDarkMode;

  const _UsageCircle({
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
          progressColor: Colors.blueAccent,
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

class _ServiceItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool highlight;
  final bool isDarkMode;

  const _ServiceItem({
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
                      ? Colors.orange
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
                        color: Colors.orange,
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
