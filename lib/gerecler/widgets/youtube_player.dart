//Video Ekranı
import 'package:flutter/material.dart';
import 'package:interact_kid/gerecler/lottie_animasyonlar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Widget youtubePlayer(v, controller) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: false,
            onEnded: (YoutubeMetaData md) {
              v();
            }),
      ),
      Expanded(
        flex: 1,
        child: animation(),
      ),
    ],
  );
}
