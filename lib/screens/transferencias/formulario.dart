
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _titleAppBar="Criando Transferências";
const _labelFieldValue= "Valor";
const _tipsFieldValue="0.00";
const _labelNumberAccount= "Número da Conta";
const _tipsNumberAccount="0000";
const _textButton ="Confirmar";

class FormularioTransferencias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormTransferState();
  }
}

class FormTransferState extends State<FormularioTransferencias> {
  final TextEditingController _controllerFieldNumberAccount =
  TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controller: _controllerFieldNumberAccount,
                label: _labelNumberAccount,
                tips: _tipsNumberAccount),
            Editor(
                controller: _controllerFieldValue,
                label: _labelFieldValue,
                tips: _tipsFieldValue,
                icon: Icons.monetization_on),
            RaisedButton(
              child: Text(_textButton),
              onPressed: () => _createTransfer(context),
            ),
          ],
        ),
      ),
    );
  }
  void _createTransfer(BuildContext context) {
    final int numberAccount = int.tryParse(_controllerFieldNumberAccount.text);
    final double value = double.tryParse(_controllerFieldValue.text);

    if (numberAccount != null && value != null) {
      final transferCreated = Transferencia(value, numberAccount);
      debugPrint("Criando Transferência");
      Navigator.pop(context, transferCreated);
    }
  }
}
