import 'package:flutter/material.dart';
import 'dart:convert';
import '../../rotas/rota.dart';
import '../details/details.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _homepage();
  }

  Widget _homepage() {
    return Scaffold(
      body: _listHome(),
      appBar: _appbarhome(),
    );
  }

  Widget _listHome() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/rotas.json'),
      builder: (context, snapshot) {
        List<dynamic> rotas = json.decode(
          snapshot.data.toString(),
        );

        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Rota rota = Rota.fromJson(
              rotas[index],
            );
            return _cardhome(
              rota,
            );
          },
          itemCount: rotas == null ? 0 : rotas.length,
        );
      },
    );
  }

  Widget _cardhome(rota) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(rota: rota),
          ),
        );
      },
      child: SizedBox(
        height: 260,
        child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _imageCard(rota.photo),
                  _gradientCard(),
                  _textCard(rota.title),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textCard(title) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _gradientCard() {
    return Container(
      height: 228,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.0, 0.5),
          end: const Alignment(0.0, -1),
          colors: [Colors.transparent, Colors.green.withOpacity(0.7)],
        ),
      ),
    );
  }

  Widget _imageCard(photo) {
    return Image.asset(
      photo,
      fit: BoxFit.fill,
      height: 228,
    );
  }

  Widget _appbarhome() {
    return AppBar(
      title: Text('Caminha USP'),
    );
  }
}
