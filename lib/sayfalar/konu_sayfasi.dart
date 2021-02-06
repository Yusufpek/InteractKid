import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../gerecler/sesler.dart';
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
  bool isVideoEnded = false;
  int _index = 0;
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
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await sesleriYukle();
  }

  @override
  void deactivate() {
    _controller ?? _controller.pause();
    print('deactive');
    super.deactivate();
  }

  @override
  void dispose() {
    //Sayfadan çıkarken ekranı dikey konuma getiriyoruz.
    //Eğer video tam ekran olursa ekranımız diğer sayfalarda yatay ekran olarak kalıyor.
    setScreenPortrait();
    _controller ?? _controller.dispose();
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.konu.baslik),
        centerTitle: true,
      ),
      body: Center(
        child: isVideoEnded ? sorular() : youtubePlayer(),
      ),
    );
  }

  void setScreenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Widget youtubePlayer() {
    return YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
        onEnded: (YoutubeMetaData md) {
          setScreenPortrait();
          _controller.pause();
          setState(() => isVideoEnded = true);
        });
  }

  Widget sorular() {
    var _siklar = <String>[
      konu.sorular[_index].secenek1,
      konu.sorular[_index].secenek2,
      konu.sorular[_index].secenek3,
      konu.sorular[_index].secenek4,
    ];
    _siklar.shuffle();

    return Column(
      children: <Widget>[
        Container(
          height: 200,
          child: Image.network(
            konu.sorular[_index].soruResmi,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _siklar.length,
            itemBuilder: (c, i) => _con(_siklar[i]),
          ),
        ),
      ],
    );
  }

  Widget _con(String url) {
    bool _isCorrect;
    void checkAnswer() async {
      _isCorrect = url == konu.sorular[_index].dogruCevap ? true : false;
      if (_isCorrect) {
        await dogruCevapSesiniCal();
        if (_index < (konu.sorular.length - 1)) {
          _index++;
        } else {
          Navigator.pop(context);
        }
      } else {
        await yanlisCevapSesiniCal();
      }
      setState(() {});
    }

    return InkWell(
      onTap: checkAnswer,
      child: Container(
        width: 150,
        height: 150,
        padding: EdgeInsets.all(20),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (context, o, s) {
            return Icon(Icons.error_outline_outlined);
          },
        ),
      ),
    );
  }
}
