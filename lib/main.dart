import 'package:flame/game.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flappybird/screens/game_over.dart';
import 'package:flappybird/screens/main_menu.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final game = FlappyBirdGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [
        'mainMenu',
      ],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}
