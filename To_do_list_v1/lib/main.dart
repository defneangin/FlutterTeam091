import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:timer_count_down/timer_count_down.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "What To Do B91 Team",
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: Taslak(),
    );
  }
}

class Taslak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Görev Listesi',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                ))
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
            return Cark_Ekrani(yapilacaklarListesi: yapilacaklarListesi);
          },));
  }

  sayacaGit(){
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Sayac_Sayfasi();
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
                title: Text(yapilacaklarListesi[siraNumarasi],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                    )),
              ),
            ),
          ),
          TextField(
            controller: t1,
          ),
          ElevatedButton(
            onPressed: elemanEkle,
            child: Text("Görev ekle",
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    )),
          ),
          ElevatedButton(
            onPressed: elemanCikar,
            child: Text("Görev çıkar",
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    )),
          ),
          ElevatedButton(
            onPressed: carkaGit,
            child: Text("Çarka git",
            style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    )),
          ),
          ElevatedButton(
            onPressed: sayacaGit,
            child: Text("Sayacı başlat",
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    )),
          ),
        ],
      ),
    );
  }
}

class Sayac_Sayfasi extends StatelessWidget {
  const Sayac_Sayfasi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayaç / Pomodoro"),
      ),
      body: Center(

        child: (
        Countdown(

          seconds: 1500,
          build: (
              BuildContext context, time) =>
              Text(

                  time.toString(),
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w200,
                )

              ),

          interval:
          Duration(milliseconds: 100),
          onFinished: () {
            print('25 dakika sona erdi, tebrikler!');
          },
        )
    ),
      ),
    );
  }
}

class Cark_Ekrani extends StatelessWidget {
  const Cark_Ekrani({
    Key? key,
    required this.yapilacaklarListesi,
  }) : super(key: key);

  final List yapilacaklarListesi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Görev Çarkı"),
      ),
      body:
      FortuneWheel(
        selected: controller.stream,
        items: [
          for (var i in yapilacaklarListesi) FortuneItem(child:
          Text(i,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )
          )),
        ],
      ),
    );
  }
}