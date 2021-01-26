import 'package:flutter/material.dart';
import 'package:pdc/componets/stepp.dart';

class Insert extends StatefulWidget {
  @override
  _InsertState createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('FICHA - PRESTAÇÃO DE CONTA'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView(
          children: [
            StepperDemo(
              title: 'SALDO ANTERIOR',
              column: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Frango'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Feijão'),
                  ),
                ],
              ),
              valueCurrentStep: 0,
            ), StepperDemo(
              title: 'CONFECÇÃO DO DIA',
              column: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Frango'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Feijão'),
                  ),
                ],
              ),
              valueCurrentStep: 1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.list), onPressed: null //switchStepsType,
          ),
    );
  }
}
