import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/bird_movement.dart';
import 'package:flappybird/game/config.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/animation.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();

  @override
  FutureOr<void> onLoad() async {
    final birdMid = await gameRef.loadSprite(AppAssets.birdMidFlap);
    final birdUp = await gameRef.loadSprite(AppAssets.birdUpFlap);
    final birdDown = await gameRef.loadSprite(AppAssets.birdDownFlap);

    gameRef.bird;
    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.up;
    sprites = {
      BirdMovement.middle: birdMid,
      BirdMovement.down: birdDown,
      BirdMovement.up: birdUp,
    };
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelociry * dt;
  }

  @override
  onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  fly() {
    add(
      MoveByEffect(
        Vector2(0, -Config.gravity),
        EffectController(
          duration: 0.2,
          curve: Curves.decelerate,
        ),
        onComplete: () => current = BirdMovement.down,
      ),
    );
    current = BirdMovement.up;
  }

  gameOver() {
    game.isCollided = true;
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
  }

  reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
  }
}
