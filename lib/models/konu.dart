import 'soru.dart';

class Konu {
  final String baslik;
  //AssetImage resim;
  final String resimLinki;
  final String videoUrl;
  final List<Soru> sorular;

  Konu({this.baslik, this.resimLinki, this.videoUrl, this.sorular});
}
