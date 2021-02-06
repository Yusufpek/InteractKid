import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer audioPlayer = AudioPlayer();
AudioCache cache = AudioCache();
Future<void> sesleriYukle() async {
  await cache.load('tebrik.mp3');
  await cache.load('yanlisCevap.mp3');
}

Future<AudioPlayer> dogruCevapSesiniCal() async {
  return await cache.play('tebrik.mp3');
}

Future<void> yanlisCevapSesiniCal() async {
  var result = await audioPlayer.play('yanlisCevap.mp3', isLocal: true);
}

Future<AudioPlayer> soruyuOku(String ses) async {
  return await cache.play(ses);
}
