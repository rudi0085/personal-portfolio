import 'package:flutter/material.dart';
import 'package:portfolio_projct/core/theme/app_color.dart';
import 'package:portfolio_projct/home/presentation/pages/home_page.dart';
import 'package:portfolio_projct/core/theme/app_text_style.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,

      // ========== LIGHT THEME ==========
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: AppColors.lightColorScheme,
        scaffoldBackgroundColor: AppColors.neutral100,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.neutral100,
          elevation: 0,
        ),
        textTheme: TextTheme(
          headlineMedium: AppTextStyle.headlineMedium.copyWith(
            color: AppColors.neutral10,
          ),
          titleMedium: AppTextStyle.titleMedium.copyWith(
            color: AppColors.neutral20,
          ),
          bodyLarge: AppTextStyle.bodyLarge.copyWith(
            color: AppColors.neutral20,
          ),
          labelLarge: AppTextStyle.labelLarge.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),

      // ========== DARK THEME ==========
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: AppColors.darkColorScheme,
        scaffoldBackgroundColor: AppColors.darkSurface,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkSurface,
          elevation: 0,
        ),
        textTheme: TextTheme(
          headlineMedium: AppTextStyle.headlineMedium.copyWith(
            color: AppColors.neutral95,
          ),
          titleMedium: AppTextStyle.titleMedium.copyWith(
            color: AppColors.neutral80,
          ),
          bodyLarge: AppTextStyle.bodyLarge.copyWith(
            color: AppColors.neutral90,
          ),
          labelLarge: AppTextStyle.labelLarge.copyWith(
            color: AppColors.darkPrimary,
          ),
        ),
      ),

      home: MyHomePage(onThemeToggle: _toggleTheme),
    );
  }
}
