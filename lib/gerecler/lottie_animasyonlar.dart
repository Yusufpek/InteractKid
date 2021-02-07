import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//Rastgele animasyon seçme komutumuz
List<String> animations = ['animasyon1', 'animasyon2', 'animasyon3'];

Widget animation() {
  var rnd = Random();
  var i = rnd.nextInt(animations.length);
  return Container(
    child: Lottie.asset('assets/${animations[i]}.json'),
  );
}
