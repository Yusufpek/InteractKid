import 'package:flutter/material.dart';

import 'package:interact_kid/models/konu.dart';
import 'package:interact_kid/sayfalar/konu_detay_sayfasi.dart';
import '../stiller.dart';

Widget konuWidget(Konu k, BuildContext context) {
  return InkWell(
    onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (c) => KonuSayfasi(k))),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellowAccent[100],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 3,
        ),
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
          Text('${k.baslik}', style: Stiller.baslik),
        ],
      ),
    ),
  );
}
