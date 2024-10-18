import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'providers/auth_provider.dart';
import 'providers/level_provider.dart';
import 'providers/score_provider.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LevelProvider()),
        ChangeNotifierProvider(create: (_) => ScoreProvider()),
      ],
      child: MaterialApp(
        title: 'Kids Math Game',
        theme: AppTheme.lightTheme,
        initialRoute: '/',  // This sets the initial route
        routes: routes,      // Your routes map
      ),
    );
  }
}
