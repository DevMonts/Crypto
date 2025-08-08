import 'package:crypto/common/constants/app_strings.dart';
import 'package:crypto/common/constants/app_theme.dart';
import 'package:crypto/features/coins/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto',
      theme: AppTheme.lightTheme,
      home: const HomePage(title: AppStrings.wallet),
    );
  }
}
