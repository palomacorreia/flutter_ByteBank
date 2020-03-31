
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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