
import 'package:db_miner_quotes_app/views/quotes_screens/life.dart';
import 'package:db_miner_quotes_app/views/quotes_screens/love.dart';
import 'package:db_miner_quotes_app/views/quotes_screens/motivation.dart';
import 'package:db_miner_quotes_app/views/quotes_screens/positive.dart';
import 'package:db_miner_quotes_app/views/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isIntroOver = prefs.getBool('isIntroOver') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isIntroOver == true) ? 'HomePage' : '/',
      routes: {
        '/' : (context) =>   IntroScreen(),
        'HomePage' : (context) => HomePage(),
        'Motivation_screen' : (context) => Motivation_Screen(),
        'Positive_screen' : (context) => Positive_screen(),
        'Love_screen' : (context) => Love_Screen(),
        'Life_screen' : (context) => Life_Screen(),
      },
    ),
  );
}