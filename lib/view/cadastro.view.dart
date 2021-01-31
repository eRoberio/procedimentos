import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:pdc/models/stepp_models.dart';

class CadastroSteep extends StatefulWidget {
  @override
  _CadastroSteepState createState() => _CadastroSteepState();
}

class _CadastroSteepState extends State<CadastroSteep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('PRESTAÇÃO DE CONTA.'),
      ),
      body: new StepperBody(),
    );
  }
}

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => new _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  DateTime _dateInfo = DateTime.now();
  int currStep = 0;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static MyData data = new MyData();

  @override
  void initState() {
    super.initState();
  }

  List<Step> steps = [
    new Step(
        title: const Text('SALDO ANTERIOR'),
        isActive: true,
        state: StepState.indexed,
        content: Column(
          children: [
            TextFormField(
              initialValue: data.frango,
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String value) {
                //VALOR QUE VAI SUBSTITUIR O VALOR DA API

                data.frango = value;
              },
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'FRANGO',
                  hintText: data.frango, //Valor que vem da API
                  //filled: true,
                  icon: const Icon(Icons.food_bank),
                  labelStyle: new TextStyle(
                      decorationStyle: TextDecorationStyle.solid)),
            ),
            TextFormField(
              initialValue: data.feijao,
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String value) {
                //VALOR QUE VAI SUBSTITUIR O VALOR DA API
                data.feijao = value;
              },
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'FEIJAO',
                  hintText: data.feijao, //Valor que vem da API
                  //filled: true,
                  icon: const Icon(Icons.grain),
                  labelStyle: new TextStyle(
                      decorationStyle: TextDecorationStyle.solid)),
            )
          ],
        )),
    new Step(
        title: const Text('CONFECÇÃO DO DIA'),
        isActive: true,
        state: StepState.indexed,
        content: Column(
          children: [
            TextFormField(
              initialValue: data.frango_dia,
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String value) {
                //VALOR QUE VAI SUBSTITUIR O VALOR DA API

                value = data.frango_dia;
              },
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'FRANGO',
                  hintText: data.frango_dia, //Valor que vem da API
                  //filled: true,
                  icon: const Icon(Icons.food_bank),
                  labelStyle: new TextStyle(
                      decorationStyle: TextDecorationStyle.solid)),
            ),
            TextFormField(
              initialValue: data.feijao_dia,
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String value) {
                //VALOR QUE VAI SUBSTITUIR O VALOR DA API
                value = data.feijao_dia;
              },
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'FEIJAO',
                  hintText: data.feijao_dia,
                  //Valor que vem da API
                  icon: const Icon(Icons.grain),
                  labelStyle: new TextStyle(
                      decorationStyle: TextDecorationStyle.solid)),
            )
          ],
        )),
    new Step(
        title: const Text('RECEBIMENTO'),
        isActive: true,
        state: StepState.indexed,
        content: Column(
          children: [
            TextFormField(
              initialValue: data.frango_rec,
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String value) {
                //VALOR QUE VAI SUBSTITUIR O VALOR DA API

                data.frango_rec = value;
              },
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'FRANGO',
                  hintText: data.frango_rec, //Valor que vem da API
                  //filled: true,
                  icon: const Icon(Icons.food_bank),
                  labelStyle: new TextStyle(
                      decorationStyle: TextDecorationStyle.solid)),
            ),
            TextFormField(
              initialValue: data.feijao_rec,
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String value) {
                //VALOR QUE VAI SUBSTITUIR O VALOR DA API
                data.feijao_rec = value;
              },
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'FEIJAO',
                  hintText: data.feijao_rec, //Valor que vem da API
                  //filled: true,
                  icon: const Icon(Icons.grain),
                  labelStyle: new TextStyle(
                      decorationStyle: TextDecorationStyle.solid)),
            )
          ],
        )),
    new Step(
        title: const Text('DEBITOS PROGRAMADOS'),
        isActive: true,
        state: StepState.indexed,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.all(color: Colors.red),
              children: [
                TableRow(children: [
                  Text(' DESCRIÇÃO',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  Text(' QTD',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  Text(' VALOR',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                ]),
                TableRow(children: [
                  Text(' COENTRO + CEBOLA + FARINHA',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  Text('  ',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  Text(' R\$',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                ]),
              ],
            )
          ],
        )),
  ];

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context)
          .showSnackBar(new SnackBar(content: new Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Verifique se os Dados estão corretos !');
      } else {
        formState.save();

        showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text("Confira os dados"),
              //content: new Text("Hello World"),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    Text('SALDO ANTERIOR',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    new Text("FRANGO : " + data.frango),
                    new Text("FEIJAO : " + data.feijao),
                    SizedBox(
                      height: 10,
                    ),
                    Text('CONFECÇÃO DO DIA',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    new Text("FRANGO : " + data.frango_dia),
                    new Text("FEIJAO : " + data.feijao_dia),
                    SizedBox(
                      height: 10,
                    ),
                    Text('RECEBIMENTO',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    new Text("FRANGO : " + data.frango_rec),
                    new Text("FEIJAO : " + data.feijao_rec),
                    SizedBox(
                      height: 10,
                    ),
                    new Text("Data: $_dateInfo"),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      }
    }

    return new Container(
        child: new Form(
      key: _formKey,
      child: new ListView(children: <Widget>[
        FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  DateFormat("EEE  d/M/yyyy").format(_dateInfo),
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
            if (dtPick != null && dtPick != _dateInfo) {
              setState(() {
                _dateInfo = dtPick;
              });
            }
          },
        ),
        new Stepper(
          steps: steps,
          type: StepperType.vertical,
          currentStep: this.currStep,
          onStepContinue: () {
            setState(() {
              if (currStep < steps.length - 1) {
                currStep = currStep + 1;
              } else {
                currStep = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currStep > 0) {
                currStep = currStep - 1;
              } else {
                currStep = 0;
              }
            });
          },
          onStepTapped: (step) {
            setState(() {
              currStep = step;
            });
          },
        ),
        new RaisedButton(
          child: new Text(
            'CONFIRMAR INFORMAÇÕES',
            style: new TextStyle(color: Colors.white),
          ),
          onPressed: _submitDetails,
          color: Colors.redAccent,
        ),
      ]),
    ));
  }
}
