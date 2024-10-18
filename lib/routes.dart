import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/game/levels_map_screen.dart';
import 'screens/game/game_screen.dart';
import 'screens/game/result_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/levelsMap': (context) => LevelsMapScreen(),
  '/game': (context) => GameScreen(level: 1), // You can modify this to accept a dynamic level
  '/result': (context) => ResultScreen(score: 0,),
};
