import 'package:flutter/material.dart';

/*void main() {
  runApp(MaterialApp(
    home: RadiooButton(),
    debugShowCheckedModeBanner: false,
  ));
}
*/
List genderList = ['Male', 'Female', 'Other'];

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
            'Gender : ',
            style: TextStyle(fontWeight: FontWeight.w400),
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

/*
foto
nome
email
sexo
alergias
*/
