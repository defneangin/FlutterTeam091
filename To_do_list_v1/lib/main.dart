import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "What To Do Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('What To Do')
        ),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}
StreamController<int> controller = StreamController.broadcast();

class _AnaEkranState extends State<AnaEkran> {
  bool value = false;
  TextEditingController t1 = TextEditingController();
  List yapilacaklarListesi = [ ];

  elemanEkle(){
    setState(() {
      yapilacaklarListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar(){
    setState(() {
      yapilacaklarListesi.remove(t1.text);
      t1.clear();
    });
  }
  carkaGit(){
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar:  AppBar(),
              body:
            FortuneWheel(
              selected: controller.stream,
              items: [
              for (var i in yapilacaklarListesi) FortuneItem(child: Text(i)),
              ],
            )
            );
    },));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: yapilacaklarListesi.length,
              itemBuilder: (context, siraNumarasi) => ListTile(
                subtitle: Text(""),
                title: Text(yapilacaklarListesi[siraNumarasi]),
              ),
            ),
          ),
          TextField(
            controller: t1,
          ),
          ElevatedButton(
            onPressed: elemanEkle,
            child: Text("Ekle"),
          ),
          ElevatedButton(
            onPressed: elemanCikar,
            child: Text("Çıkar"),
          ),
          ElevatedButton(
              onPressed: carkaGit,
              child: Text("Çarka Git"),
          )
        ],
      ),
    );
  }
}
