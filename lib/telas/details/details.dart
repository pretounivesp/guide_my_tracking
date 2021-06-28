import 'package:flutter/material.dart';
import '../../rotas/rota.dart';
import '../maps/maps.dart';

//--Funcoes usados no app
double tempo(double velocidade, int distance) {
  double time = distance / (velocidade * 16.7);
  return time;
}

double calorias(double constcalorias, int distance, double velocidade) {
  double calorias = 10.0;
  double peso = 70.0;
  double time = distance / (velocidade * 16.7);

  calorias = constcalorias * (time / 30.0);
  calorias =
      calorias + ((constcalorias * (time / 30.0)) * ((peso - 68.0) / 70.0));
  return calorias;
}
//--Fim funcoes

class Details extends StatefulWidget {
  final Rota rota;

  Details({Key key, @required this.rota}) : super(key: key);

  _Details createState() => _Details();
}

class _Details extends State<Details> {
  var sliderValue = 2.0;
  var time = 0.0;
  var velocidade = 0.0;
  var calories = 0.0;
  var cor = "0xff4caf50";

  @override
  Widget build(BuildContext context) {
    var distance = widget.rota.distance;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _imageDetails(widget.rota.photo),
          _titlerota(widget.rota.title),
          Container(
            child: Align(
              child: Material(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _iconsDetailsDistance(
                            Icons.directions_run,
                            distance,
                          ),
                          _iconsDetailsTime(
                            Icons.schedule,
                            time,
                            distance,
                          ),
                          _iconsDetailsCalories(
                            Icons.sentiment_very_satisfied,
                            calories,
                            distance,
                          ),
                        ],
                      ),
                      _iconsDetailsVelocidade(velocidade, cor),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Slider(
                            min: 0.0,
                            max: 9.0,
                            divisions: 9,
                            value: sliderValue,
                            // label: (sliderValue).round().toString(),
                            activeColor: Colors.green,
                            inactiveColor: Colors.blueGrey,
                            onChanged: (newValue) {
                              setState(
                                () {
                                  sliderValue = newValue;
                                  if (sliderValue >= 0.0 &&
                                      sliderValue <= 0.9) {
                                    time = tempo((sliderValue + 2.0), distance);
                                    velocidade = (sliderValue + 2.0);
                                    calories = calorias(
                                        41.0, distance, (sliderValue + 2.0));
                                    cor = "#039dfc";
                                  }
                                  if (sliderValue >= 1.0 &&
                                      sliderValue <= 1.9) {
                                    time = tempo((sliderValue + 1.5), distance);
                                    velocidade = (sliderValue + 1.5);
                                    calories = calorias(
                                        57.0, distance, (sliderValue + 1.5));
                                    cor = "#00b0c4";
                                  }
                                  if (sliderValue >= 2.0 &&
                                      sliderValue <= 2.9) {
                                    time = tempo((sliderValue + 1.0), distance);
                                    velocidade = (sliderValue + 1.0);
                                    calories = calorias(
                                        73.0, distance, (sliderValue + 1.0));
                                    cor = "0xff4caf50";
                                  }
                                  if (sliderValue >= 3.0 &&
                                      sliderValue <= 3.9) {
                                    time = tempo((sliderValue + 0.5), distance);
                                    velocidade = (sliderValue + 0.5);
                                    calories = calorias(
                                        89.0, distance, (sliderValue + 0.5));
                                    cor = "#00c403";
                                  }
                                  if (sliderValue >= 4.0 &&
                                      sliderValue <= 4.9) {
                                    time = tempo((sliderValue + 0.0), distance);
                                    velocidade = (sliderValue + 0.0);
                                    calories = calorias(
                                        105.0, distance, (sliderValue + 0.0));
                                    cor = "#52c400";
                                  }
                                  if (sliderValue >= 5.0 &&
                                      sliderValue <= 5.9) {
                                    time = tempo((sliderValue - 0.5), distance);
                                    velocidade = (sliderValue - 0.5);
                                    calories = calorias(
                                        121.0, distance, (sliderValue - 0.5));
                                    cor = "#93c400";
                                  }
                                  if (sliderValue >= 6.0 &&
                                      sliderValue <= 6.9) {
                                    time = tempo((sliderValue - 1.0), distance);
                                    velocidade = (sliderValue - 1.0);
                                    calories = calorias(
                                        137.0, distance, (sliderValue - 1.0));
                                    cor = "#c4bd00";
                                  }
                                  if (sliderValue >= 7.0 &&
                                      sliderValue <= 7.9) {
                                    time = tempo((sliderValue - 1.5), distance);
                                    velocidade = (sliderValue - 1.5);
                                    calories = calorias(
                                        153.0, distance, (sliderValue - 1.5));
                                    cor = "#c47f00";
                                  }
                                  if (sliderValue >= 8.0 &&
                                      sliderValue <= 8.9) {
                                    time = tempo((sliderValue - 2.0), distance);
                                    velocidade = (sliderValue - 2.0);
                                    calories = calorias(
                                        169.0, distance, (sliderValue - 2.0));
                                    cor = "#c45b00";
                                  }
                                  if (sliderValue >= 9.0 &&
                                      sliderValue <= 9.9) {
                                    time = tempo((sliderValue - 2.5), distance);
                                    velocidade = (sliderValue - 2.5);
                                    calories = calorias(
                                        185.0, distance, (sliderValue - 2.5));
                                    cor = "#c42100";
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _textdetails('Detalhes da Rota'),
          _text(widget.rota.description),
          _textdetails('Rota'),
          _cardMapa(context),
          _textdetails('Mais Imagens'),
        ],
      ),
      appBar: _appbar(widget.rota),
    );
  }
}

Widget _imageDetails(image) {
  return Image.asset(
    image,
  );
}

Widget _titlerota(title) {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 5, 16, 16),
    child: Center(
      child: Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.green,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget _iconsDetailsDistance(icone, distance) {
  return Expanded(
    child: Column(
      children: <Widget>[
        Icon(icone, color: Colors.green),
        Text(
          ("~" + distance.toString() + " m"),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

Widget _iconsDetailsTime(icone, time, distance) {
  if (time == 0.0) {
    time = tempo(3.0, distance);
  }
  return Expanded(
    child: Column(
      children: <Widget>[
        Icon(icone, color: Colors.green),
        Text(
          ("~" + time.toStringAsFixed(0) + " min"),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

Widget _iconsDetailsCalories(icone, calories, distance) {
  if (calories == 0.0) {
    calories = calorias(73.0, distance, 3.0);
  }
  return Expanded(
    child: Column(
      children: <Widget>[
        Icon(icone, color: Colors.green),
        Text(
          ("~" + calories.toStringAsFixed(1) + " kcal"),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

Widget _iconsDetailsVelocidade(velocidade, cor) {
  String color = cor.replaceAll('#', '0xff');
  if (velocidade == 0.0) {
    velocidade = 3.0;
  }
  return Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
      child: Text(
        ("Velocidade:   " + velocidade.toStringAsFixed(1) + " km/h"),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(int.parse(color)),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
  );
}

Widget _textdetails(caption) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
    child: Center(
      child: Text(
        caption,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.green,
          fontSize: 25,
        ),
      ),
    ),
  );
}

Widget _text(text) {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
    child: Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
  );
}

Widget _cardMapa(context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Mapa(),
        ),
      );
    },
    child: Image.asset(
      "assets/images/google_maps.jpg",
      fit: BoxFit.fill,
      height: 228,
    ),
  );
}

Widget _appbar(rota) {
  return AppBar(
    title: Text(
      rota.title,
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 18),
    ),
  );
}
