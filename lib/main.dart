import 'package:flutter/material.dart';
import 'package:hamrahe_man_demo/home/home_page.dart';
import 'package:hamrahe_man_demo/theme/app_theme.dart';

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

  @override
  void initState() {
    super.initState();
    // Pre-cache important assets to avoid jank on first display
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage('assets/arka.png'), context);
    });
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  ThemeData _getLightTheme() => AppTheme.light();

  ThemeData _getDarkTheme() => AppTheme.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arka UI Demo',
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
