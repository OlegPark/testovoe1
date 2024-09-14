import 'package:flutter/material.dart';
import 'package:testovoe1/theme/theme.dart';
import 'mood_diary/mood_diary_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ru', 'RU'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColorPage
      ),
      home: MoodDiary(),
    );
  }
}