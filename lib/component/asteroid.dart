import 'dart:async';


import 'package:flame/components.dart';
class Asteroid extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    sprite = await game.loadSprite("meteor/spaceMeteors_001.png");
  }
  position = Vector2(game.size.x / 2, game.size.y / 2);
}