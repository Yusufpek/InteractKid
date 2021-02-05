import 'package:flutter/material.dart';

import '../widgets/dersWidget.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Interact Kid'),
          centerTitle: true,
        ),
        body: GridView.count(
            primary: false,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            padding: const EdgeInsets.all(20),
            children: DersWidget.dersKonulari()));
  }
}
