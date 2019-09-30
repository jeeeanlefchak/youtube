import 'package:flutter/material.dart';
import 'package:youtbe/telas/Biblioteca.dart';
import 'package:youtbe/telas/Incri%C3%A7%C3%A3o.dart';
import 'package:youtbe/telas/Inicio.dart';
import 'package:youtbe/telas/emAlta.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> _telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items:[
          BottomNavigationBarItem(
            title: Text("inicio"),
            icon: Icon(Icons.home)
          ),BottomNavigationBarItem(
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot)
          ),BottomNavigationBarItem(
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions)
          ),BottomNavigationBarItem(
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder)
          ),
        ]
      ),
    );
  }
}
