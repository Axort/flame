import 'package:flame/game/base_game.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:test/test.dart';

import 'package:flame/components/position_component.dart';
import 'package:flame/components/mixins/resizable.dart';

class MyComponent extends PositionComponent with Resizable {
  String name;
  @override
  Vector2 size = Vector2(2.0, 2.0);

  MyComponent(this.name);
}

class MyGame extends BaseGame {}

Vector2 size = Vector2(1.0, 1.0);

void main() {
  group('resizable test', () {
    test('game calls resize on add', () {
      final MyComponent a = MyComponent('a');
      final MyGame game = MyGame();
      game.resize(size);
      game.add(a);
      expect(a.gameSize, size);
    });
    test('game calls resize after added', () {
      final MyComponent a = MyComponent('a');
      final MyGame game = MyGame();
      game.add(a);
      game.resize(size);
      expect(a.gameSize, size);
    });
    test('game calls doesnt change component size', () {
      final MyComponent a = MyComponent('a');
      final MyGame game = MyGame();
      game.add(a);
      game.resize(size);
      expect(a.size, isNot(size));
    });
  });
}
