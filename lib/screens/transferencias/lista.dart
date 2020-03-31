import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencias/formulario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _titleAppBar = "Transferências";

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
        title: Text(_titleAppBar),
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

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencias();
          })).then((transferReceived) => _updated(transferReceived));
        },
      ),
    );
  }

  void _updated(Transferencia transferReceived) {
    if (transferReceived != null) {
      setState(() {
        widget._transferencias.add(transferReceived);
      });
    }
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
