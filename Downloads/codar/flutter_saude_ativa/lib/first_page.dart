import 'package:flutter/material.dart';
import 'main.dart';
import 'data/data_profissionais.dart';

import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: new ListView.builder(
          itemCount: profissionais.length,
          itemBuilder: (BuildContext ctxt, int index) {
            double c_width = MediaQuery.of(context).size.width * 0.7;
            return Center(
              child: GestureDetector(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image.asset(profissionais[index].iImagens,
                                  height: 100, fit: BoxFit.fill),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(16.0),
                                  width: c_width,
                                  child: Column(
                                    children: [
                                      Text(profissionais[index].nome),
                                      Text(profissionais[index].descricao,
                                          textAlign: TextAlign.left)
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfissionalDescription(
                          profissional: profissionais[index])),
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
          color: Colors.orange,
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: new Image.asset('assets/images/calculadora_icone.png'),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  )
                },
              ),
              IconButton(
                icon: new Image.asset('assets/images/perfil_icone.png'),
                onPressed: () {},
              ),
              IconButton(
                icon: new Image.asset('assets/images/buscar_icone.png'),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}

class ProfissionalDescription extends StatelessWidget {
  // Declare a field that holds the Todo.
  final ProfissionaisInfo profissional;

  // In the constructor, require a Todo.
  ProfissionalDescription({Key key, @required this.profissional})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(),
            items: profissional.imagens
                .map((item) => Container(
                      child: Center(child: Image.network(item)),
                    ))
                .toList(),
          ),
          Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    profissional.nome,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(profissional.descricao, textAlign: TextAlign.center)
                ],
              )),
        ],
      )),
      bottomNavigationBar: Container(
          color: Colors.orange,
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: new Image.asset('assets/images/calculadora_icone.png'),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  )
                },
              ),
              IconButton(
                icon: new Image.asset('assets/images/perfil_icone.png'),
                onPressed: () {},
              ),
              IconButton(
                icon: new Image.asset('assets/images/buscar_icone.png'),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
