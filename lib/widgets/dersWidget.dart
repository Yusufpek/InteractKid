import 'package:flutter/material.dart';

import '../gerecler/stiller.dart';
import '../models/konular/konu.dart';
import '../models/konular/konular.dart';

class DersWidget {
  static Widget konuWidget(Konu k) {
    return InkWell(
      onTap: ()=>print(k.rota),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.yellowAccent[100],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 3,),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 125,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(k.resimLinki),
                  fit: BoxFit.fill,
                ),
              ),
            ),
             Text("${k.baslik}", style:Stiller.baslik),
          ],
        ),
      ),
    );
  }

  static List<Widget> dersKonulari() {
    List<Widget> dk = [];
    for (var i = 0; i < konular.length; i++) {
      dk.add(konuWidget(konular[i]));
    }
    return dk;
  }
}
