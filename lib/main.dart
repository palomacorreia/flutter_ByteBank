import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: ListaTransferencias()),
    );
  }
}

class FormularioTransferencias extends StatefulWidget {
  final TextEditingController _controllerFieldNumberAccount =
  TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();


}

void _createTransfer(BuildContext context) {
  final int numberAccount =
  int.tryParse(_controllerFieldNumberAccount.text);
  final double value =
  double.tryParse(_controllerFieldValue.text);

  if (numberAccount != null && value != null) {
    final transferCreated = Transferencia(value, numberAccount);
    debugPrint("Criando Transferência");
    Navigator.pop(context, transferCreated);
  }
}}

class FormTransferState extends State<FormularioTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferências"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controller: _controllerFieldNumberAccount,
                label: "Número da Conta",
                tips: "0000"),
            Editor(
                controller: _controllerFieldValue,
                label: "Valor",
                tips: "0.00",
                icon: Icons.monetization_on),
            RaisedButton(
              child: Text("Confirmar"),
              onPressed: () => _createTransfer(context),
            ),
          ],
        ),
      ),
    );
  }

  class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String tips;
  final IconData icon;

  Editor({this.controller, this.label, this.tips, this.icon});

  @override
  Widget build(BuildContext context) {
  return Padding(
  padding: const EdgeInsets.all(16.0),
  child: TextField(
  controller: controller,
  style: TextStyle(fontSize: 24.0),
  decoration: InputDecoration(
  icon: icon != null ? Icon(icon) : null,
  labelText: label,
  hintText: tips),
  keyboardType: TextInputType.number,
  ),
  );
  }
  }

  class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
  return ListaTransferenciasState();
  }
  }

  class ListaTransferenciasState extends State<ListaTransferencias> {
  //Atualizações Dinâmicas
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("Transferências"),
  ),
  body: ListView.builder(
  itemCount: widget._transferencias.length,
  itemBuilder: (context, index) {
  final transfer = widget._transferencias[index];
  return ItemTransferencia(transfer);
  },
  ),
  floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: () {
  //callback - resposta durante navigation
  final Future<Transferencia> future =
  Navigator.push(context, MaterialPageRoute(builder: (context) {
  return FormularioTransferencias();
  }));

  future.then((transferReceived) {
  debugPrint("chegou no future");
  debugPrint("$transferReceived");
  if (transferReceived != null) {
  widget._transferencias.add(transferReceived);
  }
  });
  }),
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
