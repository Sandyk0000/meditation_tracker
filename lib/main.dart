import 'package:flutter/material.dart';
import 'package:meditation_tracker/home_screen.dart';
import 'package:meditation_tracker/meditation_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MeditationData(),
      child: MyApp())
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meditation Tracker',
        home: HomeScreen(),
    );
  }
}