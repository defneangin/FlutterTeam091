import 'package:flutter/material.dart';

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

class _AnaEkranState extends State<AnaEkran> {
  bool value = false
  TextEditingController t1 = TextEditingController();
  List<String> yapilacaklarListesi = [ ];

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
                children: [
                  Checkbox(
                      value: value,
                      onChanged: (value)=> setState((); this.value = value!,
                  )
                ]
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
        ],
      ),
    );
  }
}
