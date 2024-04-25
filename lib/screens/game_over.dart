// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  const GameOverScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void onRestart() {
      game.bird.reset();
      game.overlays.remove('gameOver');
      game.resumeEngine();
    }

    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(AppAssets.gameOver),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: onRestart,
              child: const Text('Restart', style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
