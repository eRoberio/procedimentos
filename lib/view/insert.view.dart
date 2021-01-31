import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:pdc/componets/stepp.dart';
import 'package:pdc/controller/insertcontroller.dart';

class Insert extends StatefulWidget {
  @override
  _InsertState createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final controller = GetIt.I<InsertStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('FICHA - PRESTAÇÃO DE CONTA'),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          return Form(
            key: controller.formKey,
            child: new ListView(children: <Widget>[
              FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        DateFormat("EEE,  d/M/yyyy")
                            .format(controller.dateInfo),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    new Icon(Icons.calendar_today),
                  ],
                ),
                onPressed: () async {
                  final dtPick = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2031),
                  );
                  if (dtPick != null && dtPick != controller.dateInfo) {
                    controller.setDateInfo(dtPick);
                  }
                },
              ),
              StepperDemo(
                currentStep: controller.currentStep,
                onStepCancel: controller.cancel,
                onStepContinue: controller.continued,
                onStepTapped: controller.tapped,
                stepperType: controller.stepperType,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  child: new Text(
                    'CONFIRMAR INFORMAÇÕES',
                    style: new TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    controller.submitDetails(context);
                  },
                  color: Colors.redAccent,
                ),
              ),
            ]),
          );
        }));
  }
}
