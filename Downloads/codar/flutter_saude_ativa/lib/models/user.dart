import 'dart:ffi';

import 'package:flutter/material.dart';

class User {
  final String id;
  final String nome;
  final String sexo;
  final String email;
  final Float peso;
  final Float altura;
  final int idade;

  const User({
    this.id,
    @required this.nome,
    @required this.sexo,
    @required this.email,
    @required this.peso,
    @required this.altura,
    @required this.idade,
  });
}
