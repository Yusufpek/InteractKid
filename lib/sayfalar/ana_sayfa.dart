import 'package:flutter/material.dart';

import '../gerecler/konular.dart';
import '../widgets/dersWidget.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interact Kid'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: konular.length,
        itemBuilder: (c, i) {
          return konuWidget(konular[i], c);
        },
      ),
    );
  }
}
