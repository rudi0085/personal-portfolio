import 'package:flutter/material.dart';
import 'package:portfolio_projct/core/theme/app_color.dart';

class AppBarHeaderWidget extends StatelessWidget {
  const AppBarHeaderWidget({
    super.key,
    required this.title,
    required this.onThemeToggle,
    required this.onMenuTap,
    required this.currentIndex,
  });

  final String title;
  final VoidCallback onThemeToggle;
  final ValueChanged<int> onMenuTap;
  final int currentIndex;

  static const _mobileBreakpoint = 800.0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _mobileBreakpoint;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 64,
            vertical: isMobile ? 16 : 32,
          ),
          child: Row(
            children: [
              // Title
              Text(title, style: Theme.of(context).textTheme.headlineMedium),
              const Spacer(),

              // Menu / Hamburger
              if (!isMobile)
                AppBarMenu(currentIndex: currentIndex, onTap: onMenuTap)
              else
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => _showMobileMenu(context),
                  tooltip: 'Menu',
                ),

              // Actions (Get in Touch + Theme)
              const SizedBox(width: 8),
              if (!isMobile)
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {}, // ganti aksi jika perlu
                      child: const Text('Get in Touch'),
                    ),
                    const SizedBox(width: 12),
                    _ThemeToggle(
                      isDarkMode: isDarkMode,
                      onToggle: onThemeToggle,
                    ),
                  ],
                )
              else
                _ThemeToggle(isDarkMode: isDarkMode, onToggle: onThemeToggle),
            ],
          ),
        );
      },
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(_items.length, (i) {
              final label = _items[i];
              final active = currentIndex == i;
              return ListTile(
                title: Text(
                  label,
                  style: TextStyle(
                    color: active
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    fontWeight: active ? FontWeight.w700 : null,
                  ),
                ),
                onTap: () {
                  Navigator.of(ctx).pop();
                  onMenuTap(i);
                },
              );
            }),
          ),
        );
      },
    );
  }

  static const List<String> _items = ['Home', 'About', 'Projects', 'Contact'];
}

class AppBarMenu extends StatelessWidget {
  const AppBarMenu({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final ValueChanged<int> onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final items = const ['Home', 'About', 'Projects', 'Contact'];
    final activeColor = Theme.of(context).colorScheme.primary;
    final normalColor = Theme.of(context).textTheme.titleMedium?.color;

    return Row(
      children: List.generate(items.length, (index) {
        final isActive = currentIndex == index;

        return Padding(
          padding: EdgeInsets.only(right: index == items.length - 1 ? 0 : 20),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => onTap(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: Text(
                items[index],
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: isActive ? activeColor : normalColor,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  const _ThemeToggle({required this.isDarkMode, required this.onToggle});

  final bool isDarkMode;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.dark_mode, color: isDarkMode ? Colors.grey : Colors.black),
        Switch.adaptive(
          activeTrackColor: AppColors.darkPrimary,
          inactiveTrackColor: AppColors.neutral60,
          activeThumbColor: AppColors.primary,
          inactiveThumbColor: AppColors.neutral40,
          value: isDarkMode,
          onChanged: (_) => onToggle(),
        ),
        Icon(
          Icons.light_mode,
          color: isDarkMode ? Colors.blueAccent : Colors.grey,
        ),
      ],
    );
  }
}
