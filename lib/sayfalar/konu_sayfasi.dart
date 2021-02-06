import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/konu.dart';

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
      flags: YoutubePlayerFlags(
        enableCaption: false,
      ),
    );

    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    //Sayfadan çıkarken ekranı dikey konuma getiriyoruz.
    //Eğer video tam ekran olursa ekranımız diğer sayfalarda yatay ekran olarak kalıyor.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.konu.baslik),
        centerTitle: true,
      ),
      body: youtubePlayer(),
    );
  }

  Widget youtubePlayer() {
    return YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
        onEnded: (YoutubeMetaData md) {
          print(md);
          _controller.toggleFullScreenMode();
          Navigator.pop(context);
        });
  }
}
