import 'package:bytebank/screens/transferencias/lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.purple[600],
          accentColor: Colors.deepPurple[100],
          buttonTheme: ButtonThemeData(buttonColor: Colors.deepPurple[100])),
      home: ListaTransferencias(),
    );
  }
}


