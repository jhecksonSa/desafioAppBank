import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'ui/home/home_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  runApp(const AppBank());
}

class AppBank extends StatelessWidget {
  const AppBank({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Bank',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF089EE3),
        ),
        fontFamily: 'Mulish',
        useMaterial3: true,
      ),
      home: const HomeUi(),
      debugShowCheckedModeBanner: false,
    );
  }
}
