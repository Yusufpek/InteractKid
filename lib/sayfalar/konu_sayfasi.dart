import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/konular/konu.dart';

class KonuSayfasi extends StatefulWidget {
  final Konu konu;
  KonuSayfasi(this.konu);

  @override
  _KonuSayfasiState createState() => _KonuSayfasiState(konu);
}

class _KonuSayfasiState extends State<KonuSayfasi> {
  final Konu konu;
  _KonuSayfasiState(this.konu);

  YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(konu.videoUrl),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.konu.baslik),
        centerTitle: true,
      ),
      body: YoutubePlayer(controller: _controller),
    );
  }
}
