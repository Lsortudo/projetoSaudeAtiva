import 'package:flutter/material.dart';
import 'package:flutter_saude_ativa/first_page.dart';
import 'package:gender_selection/gender_selection.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

List genderList = ['Masculino', 'Feminino'];

class GenderField extends StatelessWidget {
  final List<String> genderList;
  GenderField(this.genderList);
  @override
  Widget build(BuildContext context) {
    String select;
    Map<int, String> mappedGender = genderList.asMap();
    return StatefulBuilder(
      builder: (_, StateSetter setState) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Gênero : ',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          ...mappedGender.entries.map(
            (MapEntry<int, String> mapEntry) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: Theme.of(context).primaryColor,
                    groupValue: select,
                    value: genderList[mapEntry.key],
                    onChanged: (value) => setState(() => select = value),
                  ),
                  Text(mapEntry.value)
                ]),
          ),
        ],
      ),
    );
  }
}

/*enum Gender { MALE, FEMALE, OTHER }

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  Gender _genderValue = Gender.MALE;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RadioListTile(
              title: const Text('Male'),
              value: Gender.MALE,
              groupValue: _genderValue,
              onChanged: (Gender value) {
                setState(() {
                  _genderValue = value;
                  int sexo = 1;
                });
              },
            ),
            RadioListTile(
              title: const Text('Female'),
              value: Gender.FEMALE,
              groupValue: _genderValue,
              onChanged: (Gender value) {
                setState(() {
                  _genderValue = value;
                  int sexo = 2;
                });
              },
            ),
            RadioListTile(
              title: const Text('Other'),
              value: Gender.OTHER,
              groupValue: _genderValue,
              onChanged: (Gender value) {
                setState(() {
                  _genderValue = value;
                  int sexo = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/
class HomeState extends State<Home> {
  String iText = "Informar todos os dados em (KG/CM)";
  String tText = "";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController testeController = TextEditingController();
  //_RadioButtonState sexoController = _RadioButtonState();

  Widget buildTextField(String label, TextEditingController c) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        border: OutlineInputBorder(),
      ),
      style: TextStyle(color: Colors.black, fontSize: 26),
      keyboardType: TextInputType.number,
      controller: c,
    );
  }

  void _resetCampos() {
    weightController.text = "";
    heightController.text = "";
    iText = "Informar todos os dados em (KG/CM)";
    tText = "";
    ageController.text = "";
  }

  void _calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double age = double.parse(ageController.text);
    double imc = weight / (height * height);
    //var sexo = Gender.values;
    /*if (Gender.values == Gender.MALE) {

      tmbMale = 66,5 + (13,75 * weight);
    }
     double tmbMale = ;
     double tmbFemale = ;
     */
    if (genderList.toString() == 'Male') {
      tText = "Teste Masculino";
    } else {
      tText = "Teste feminino";
    }

    setState(() {
      if (imc < 17) {
        iText = "IMC: Muito abaixo do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 17 && imc <= 18.49) {
        iText = "IMC: Peso ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.5 && imc <= 24.99) {
        iText = "IMC: Sobrepeso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 25 && imc <= 29.99) {
        iText = "IMC: Obesidade leve (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 30 && imc <= 34.99) {
        iText = "IMC: Obesidade severa (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 35 && imc <= 39.99) {
        iText = "IMC: Obesidade mórbida (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        iText = "IMC: Muito abaixo do peso (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Calculadora"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetCampos();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            buildTextField("Peso", weightController),
            Divider(),
            buildTextField("Altura", heightController),
            Divider(),
            buildTextField("Idade", ageController),
            Padding(
              padding: EdgeInsets.only(bottom: 1),
              child: GenderField(['Masculino', 'Feminino']),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  child: Text("Calcular",
                      style: TextStyle(color: Colors.black, fontSize: 26.0)),
                  onPressed: () {
                    _calculate();
                  },
                  color: Colors.yellow,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                iText,
                style: TextStyle(color: Colors.black, fontSize: 26.0),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                tText,
                style: TextStyle(color: Colors.black, fontSize: 26.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.pink,
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: new Image.asset('assets/images/calculadora_icone.png'),
                onPressed: () {},
              ),
              IconButton(
                icon: new Image.asset('assets/images/perfil_icone.png'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              IconButton(
                icon: new Image.asset('assets/images/buscar_icone.png'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          )),
    );
  }
}
