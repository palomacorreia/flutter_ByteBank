import 'package:flutter/material.dart';

void main() =>
    runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FormularioTransferencias ()
      ),
    );
  }
}


class FormularioTransferencias  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferências"),
      ),
    );
  }
}

class ListaTranferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(1000, 1000)),
        ItemTransferencia(Transferencia(200.0, 2000)),
        ItemTransferencia(Transferencia(300.0, 3000)),
      ],
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numConta.toString()),
        ));
  }
}

class Transferencia {
  final double valor;
  final int numConta;

  Transferencia(this.valor, this.numConta);
}