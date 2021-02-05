import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

enum Cevaplar { A, B, C, D }

class MuzikAtolyesi extends StatefulWidget {
  @override
  _MuzikAtolyesiState createState() => _MuzikAtolyesiState();
}

class _MuzikAtolyesiState extends State<MuzikAtolyesi> {
  String videoURL = "https://www.youtube.com/watch?v=0Tjbz13qy_c";
  List<String> urlLinks = [];
  YoutubePlayerController _controller;
  int soruBir = 0;
  int soruIki = 0;
  int soruUc = 0;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
    );
    super.initState();
  }

/*
  // genel homepage yapısı olusturuldu bu sekılde cevaplar ve sorular seklınde olabılır
  getVideosLinks() async {
    //urlLinks = await _firebaseServices.getVideosFromDB();
    urlLinks.forEach((element) {
      print("lınk:" + element);
    });
    print("getvideoslink icindeyız");
    videoURL = urlLinks.first;
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    "Müzik Atölyesi",
                    style: TextStyle(
                        fontFamily: "baslik",
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  YoutubePlayer(
                    controller: _controller,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      /*
                      RaisedButton(
                        onPressed: () => getVideosLinks(),
                        child: Text("bas"),
                      ),
                       */
                      Text(
                        "Notalar",
                        style: TextStyle(fontFamily: "baslik", fontSize: 30),
                      ),
                      Container(
                        child: Image.network(
                            "http://iblog.milliyet.com.tr/imgroot/blogv7/Blog333/2015/03/08/23/492196-3-4-3dec0.jpg"),
                      ),
                      /*
                      ListTile(
                        title: Text("A"),
                        trailing: Radio(
                          value: 1,
                          groupValue: soruBir,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruBir = cevap;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("B"),
                        trailing: Radio(
                          value: 2,
                          groupValue: soruBir,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruBir = cevap;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("C"),
                        trailing: Radio(
                          value: 3,
                          groupValue: soruBir,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruBir = cevap;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("D"),
                        trailing: Radio(
                          value: 4,
                          groupValue: soruBir,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruBir = cevap;
                            });
                          },
                        ),
                      ),

                       */
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Telli Çalgılar",
                        style: TextStyle(fontFamily: "baslik", fontSize: 30),
                      ),
                      Container(
                        child: Image.network(
                            "https://lh3.googleusercontent.com/proxy/wrc_d9qPvyRI4kZLpdqj7-SvB_ab7ULDOk7NxExF1JyZGhYAz3TZ49GlCMdionCVQ2tQn23tnmFcSZOlji-xeuOXFdIerlnetGj9U9cQI4BrIl-3ZtYEOd5_FLBa8w"),
                      ),
                      /*

                      ListTile(
                        title: Text("A"),
                        trailing: Radio(
                          value: 1,
                          groupValue: soruIki,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruIki = cevap;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("B"),
                        trailing: Radio(
                          value: 2,
                          groupValue: soruIki,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruIki = cevap;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("C"),
                        trailing: Radio(
                          value: 3,
                          groupValue: soruIki,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruIki = cevap;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("D"),
                        trailing: Radio(
                          value: 4,
                          groupValue: soruIki,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruIki = cevap;
                            });
                          },
                        ),
                      ),

     */
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Vurmalı Çalgılar",
                        style: TextStyle(fontFamily: "baslik", fontSize: 30),
                      ),
                      Container(
                        child: Image.network(
                            "https://www.yonkamuzikmarket.com/Uploads/Blog/Vurmali-Muzik-Aletleri-Nelerdir--Vurmali-9ba3.jpeg"),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Üflemeli Çalgılar",
                        style: TextStyle(fontFamily: "baslik", fontSize: 30),
                      ),
                      Container(
                        child: Image.network(
                            "http://karnavalsanat.com/wp-content/uploads/2015/10/Nefesli-Calgilar.jpg"),
                      ),
                      /*
                      ListTile(
                        title: Text("A"),
                        trailing: Radio(
                          value: 1,
                          groupValue: soruUc,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruUc = cevap;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("B"),
                        trailing: Radio(
                          value: 2,
                          groupValue: soruUc,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruUc = cevap;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("C"),
                        trailing: Radio(
                          value: 3,
                          groupValue: soruUc,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruUc = cevap;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("D"),
                        trailing: Radio(
                          value: 4,
                          groupValue: soruUc,
                          autofocus: false,
                          onChanged: (cevap) {
                            setState(() {
                              soruUc = cevap;
                            });
                          },
                        ),
                      ),
                      SocialLoginButton(
                        onPressed: () {
                          SpecialAlertDialog(
                                  baslik: "Cevap Gönderildi",
                                  icerik: "Cevabınız gonderıldı",
                                  anaButonYazisi: "Tamam")
                              .goster(context);
                        },
                        buttonText: "Gönder",
                        buttonIcon: Icon(Icons.save),
                      ),

                       */
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
