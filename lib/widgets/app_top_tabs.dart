import 'package:flutter/material.dart';

class AppTopTabs extends StatelessWidget implements PreferredSizeWidget {
  final List<Tab> tabs;

  const AppTopTabs({super.key, required this.tabs});

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TabBar(
      tabs: tabs,
      isScrollable: true,
      indicatorColor: colorScheme.secondary,
      labelColor: colorScheme.secondary,
      unselectedLabelColor: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }
}
