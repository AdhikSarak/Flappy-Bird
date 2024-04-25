// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/config.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flappybird/game/pipe_positioin.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.height,
    required this.pipePosition,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  FutureOr<void> onLoad() async {
    final pipe = await Flame.images.load(AppAssets.pipe);
    final pipeRotated = await Flame.images.load(AppAssets.pipeRotated);
    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }
}
