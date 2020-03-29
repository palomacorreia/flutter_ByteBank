import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: FormularioTransferencias()),
    );
  }
}

class FormularioTransferencias extends StatelessWidget {
  final TextEditingController _controllerFieldNumberAccount =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criando Transferências"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controllerFieldNumberAccount,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    labelText: "Número da Conta", hintText: "0000"),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controllerFieldValue,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: "Valor",
                    hintText: "0.00"),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text("Confirmar"),
              onPressed: () {
                debugPrint("Clicou no Confimar");

                final int numberAccount =
                    int.tryParse(_controllerFieldNumberAccount.text);
                final double value =
                    double.tryParse(_controllerFieldValue.text);

                if (numberAccount != null && value != null) {
                  final transferCreated = Transferencia(value, numberAccount);
                  debugPrint("$transferCreated");
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$transferCreated'),
                    ),
                  );
                }
              },
            )
          ],
        ));
  }
}

class ListaTranferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numConta: $numConta}';
  }
}
