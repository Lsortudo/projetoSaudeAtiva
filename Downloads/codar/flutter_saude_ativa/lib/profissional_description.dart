import 'package:flutter/material.dart';
import 'package:flutter_saude_ativa/data/data_profissionais.dart';
import 'main.dart';

void main() {
  runApp(MaterialApp(
    home: ProfissionalDescription(profissional: null,),
    debugShowCheckedModeBanner: false,
  ));
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
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Stack(children: <Widget>[new Container(child: Image.asset(''))]),
      ),
      bottomNavigationBar: Container(
          color: Colors.orange,
          padding: const EdgeInsets.all(12),
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
