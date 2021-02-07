import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:interact_kid/models/soru.dart';

AudioPlayer audioPlayer = AudioPlayer();
AudioCache cache = AudioCache();
bool isLoaded = false;
bool isLoaded1 = false;

Future<void> sesiBitir() async {
  await audioPlayer.dispose();
}

Future<void> baslangicSesleriniYukle() async {
  print(isLoaded);
  if (!isLoaded) {
    await _sesiYukle('yanlisCevap.mp3');
    await _sesiYukle('tebrik.mp3');
  }
  isLoaded = true;
}

Future<void> sesleriYukle(List<Soru> sorular) async {
  print(isLoaded1);
  if (!isLoaded1) {
    for (var soru in sorular) {
      print('${soru.soruKoku}');
      await _sesiYukle('${soru.soruKoku}');
    }
  }
  isLoaded = true;
}

Future<void> _sesiYukle(String url) async {
  var audioFile = await cache.load(url);
  await audioPlayer.setUrl(
    audioFile.path,
  );
}

/*
FutureBuilder<int> getLocalFileDuration() {
  return FutureBuilder<int>(
      future: getDuration(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return Text(
            'sample.mp3 duration is: ${Duration(milliseconds: snapshot.data)}');
      });
}
*/

Future<AudioPlayer> dogruCevapSesiniCal() async {
  return await cache.play('tebrik.mp3');
}

Future<void> yanlisCevapSesiniCal() async {
  await cache.play('yanlisCevap.mp3');
}

Future<AudioPlayer> soruyuOku(Soru soru) async {
  return await cache.play('${soru.soruKoku}');
}
