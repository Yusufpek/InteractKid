import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../gerecler/sesler.dart';
import '../gerecler/widgets/youtube_player.dart';
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

  YoutubePlayerController controller;
  bool isVideoEnded = false;
  int _index = 0;
  bool isFirstTime = true;
  var _height;
  var _width;
  @override
  void initState() {
    controller = YoutubePlayerController(
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
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    konu.sorular ?? await baslangicSesleriniYukle();
    konu.sorular ?? await sesleriYukle(konu.sorular);
  }

  @override
  void deactivate() {
    controller ?? controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    //Sayfadan çıkarken ekranı dikey konuma getiriyoruz.
    //Eğer video tam ekran olursa ekranımız diğer sayfalarda yatay ekran olarak kalıyor.
    setScreenPortrait();
    controller ?? controller.dispose();
    konu.sorular ?? sesiBitir();
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
        child: isVideoEnded ? sorular() : youtubePlayer(yPlayer, controller),
      ),
    );
  }

  void setScreenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void yPlayer() {
    setScreenPortrait();
    controller.pause();
    konu.sorular != null
        ? setState(() => isVideoEnded = true)
        : Navigator.pop(context);
  }

  //Soru ekranı
  Widget sorular() {
    //Şıkların yerinin değişmesi için listeleme yapıp shuffle kullanıyoruz.
    var _siklar = <String>[
      konu.sorular[_index].secenek1,
      konu.sorular[_index].secenek2,
      konu.sorular[_index].secenek3,
      konu.sorular[_index].secenek4,
    ];
    _siklar.shuffle();
    if (isFirstTime) {
      soruyuOku(konu.sorular[_index]);
      isFirstTime = false;
    }
    return Column(
      children: <Widget>[
        //Soru resmi
        Container(
          padding: EdgeInsets.all(5),
          height: _height * 0.2,
          width: _width * 0.7,
          child: Image.network(
            konu.sorular[_index].soruResmi,
            fit: BoxFit.fill,
          ),
        ),
        FloatingActionButton(
          onPressed: () => soruyuOku(konu.sorular[_index]),
          child: Icon(Icons.volume_up),
        ),
        //Şıklar
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                maxCrossAxisExtent: _width * 0.5,
              ),
              itemCount: _siklar.length,
              itemBuilder: (c, i) => _con(_siklar[i]),
            ),
          ),
        ),
      ],
    );
  }

  //Şık widget
  Widget _con(String url) {
    bool _isCorrect;

    //Cevap kontrolu
    void checkAnswer() async {
      _isCorrect = url == konu.sorular[_index].dogruCevap ? true : false;
      if (_isCorrect) {
        await dogruCevapSesiniCal();
        //Sesin çalması için bekleme süresi!
        await Future.delayed(Duration(seconds: 5));
        //Soru sayı kontrolü
        if (_index < (konu.sorular.length - 1)) {
          _index++;
          isFirstTime = true;
        } else {
          //Sorular bitince ana sayfaya dön
          Navigator.pop(context);
        }
      } else {
        print('yanlis cevap!');
        await yanlisCevapSesiniCal();
        await Future.delayed(Duration(seconds: 2));
      }
      setState(() {});
    }

    return InkWell(
      onTap: checkAnswer,
      child: Container(
        width: _height * 0.05,
        height: _width * 0.05,
        decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(10),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (context, object, stack) {
            return Icon(Icons.error_outline_outlined);
          },
        ),
      ),
    );
  }
}
