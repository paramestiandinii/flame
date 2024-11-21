import 'dart:async';
import 'dart:ui';

import 'package:dasar_flame/component/bgParallaxComponent.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:dasar_flame/component/asteroid.dart'; // Pastikan Asteroid diimpor
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s; // Mendeklarasikan objek Ship
  late Bgparallaxcomponent bgparallax; // Mendeklarasikan objek Bgparallaxcomponent
  
  @override
  FutureOr<void> onLoad() async {
    bgparallax = Bgparallaxcomponent(); // Membuat instance Bgparallaxcomponent
    add(bgparallax); // Menambahkan ke game

    // Membuat instance Asteroid dan menambahkannya
    Asteroid a = Asteroid();
    add(a);

    s = Ship(); // Membuat instance Ship
    add(s); // Menambahkan ke game
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    s.setTujuan(info); // Mengatur tujuan Ship berdasarkan input pengguna
  }

  @override
  void update(double dt) {
    bgparallax.changeSpeedBasedShip(s); // Mengubah kecepatan latar belakang berdasarkan posisi Ship
    super.update(dt); // Memanggil update dari kelas induk
  }

  @override
  Color backgroundColor() {
    return const Color(0xFF000045); // Menentukan warna latar belakang
  }
}
