import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = "mainMenu";
  const MainMenuScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(          
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.backgroundImage),
            opacity: 0.5,
            fit: BoxFit.fill,
            )
          ),          
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.getReady,),
                Image.asset(AppAssets.birdMidFlapImage,),
                Text("Tap to Continue", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.orange),)
              ],
            ),
          ),
        ),
      );
  }
}
