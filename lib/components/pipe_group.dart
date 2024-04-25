import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird/components/pipe.dart';
import 'package:flappybird/game/config.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flappybird/game/pipe_positioin.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final random = Random();

  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + random.nextDouble() * (heightMinusGround - spacing);

    addAll([
      Pipe(height: centerY - spacing / 2, pipePosition: PipePosition.top),
      Pipe(
          height: heightMinusGround - (centerY + spacing / 2),
          pipePosition: PipePosition.bottom)
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
  }
}
