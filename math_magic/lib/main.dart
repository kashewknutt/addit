import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'screens/main_menu.dart';
import 'screens/levels_page.dart';
import 'screens/game_page.dart';
import 'screens/result_page.dart';

void main() {
  runApp(MathMagicApp());
}

class MathMagicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Magic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 16),
          labelLarge: TextStyle(fontSize: 20),
        ),
      ),
      home: MainMenu(),
      routes: {
        '/levels': (context) => LevelsPage(),
        '/game': (context) => GamePage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  final AudioPlayer _backgroundMusicPlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();
  bool _isMusicOn = true;
  bool _isSfxOn = true;

  Future<void> playBackgroundMusic() async {
    if (_isMusicOn) {
      await _backgroundMusicPlayer.setSource(AssetSource('audio/background.mp3'));
      await _backgroundMusicPlayer.resume();
      await _backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
    }
  }

  Future<void> stopBackgroundMusic() async {
    await _backgroundMusicPlayer.stop();
  }

  void toggleBackgroundMusic() {
    _isMusicOn = !_isMusicOn;
    if (_isMusicOn) {
      playBackgroundMusic();
    } else {
      stopBackgroundMusic();
    }
  }

  Future<void> playSfx(String sfxName) async {
    if (_isSfxOn) {
      await _sfxPlayer.setSource(AssetSource('audio/$sfxName.mp3'));
      await _sfxPlayer.resume();
    }
  }

  void toggleSfx() {
    _isSfxOn = !_isSfxOn;
  }
}