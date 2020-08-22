import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphism_music_app/audio_player_screen.dart';
import 'package:neumorphism_music_app/calculator_screen.dart';

import 'credit_card_screen.dart';
import 'main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic Music App',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => Home(),
        '/cal' : (context) => CalculatorScreen(),
        '/audio' : (context) => AudioPlayerScreen(),
        '/card' : (context) => CreditCardScreen(),
      },
    );
  }
}