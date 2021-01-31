import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:pdc/models/stepp_models.dart';
import 'package:pdc/view/cadastro.view.dart';

part 'insertcontroller.g.dart';

class InsertStore = _InsertStoreBase with _$InsertStore;

abstract class _InsertStoreBase with Store {
  @observable
  MyData data = new MyData();

  @observable
  DateTime dateInfo = DateTime.now();

  @action
  void setDateInfo(DateTime value) => dateInfo = value;

  @observable
  StepperType stepperType = StepperType.vertical;

  @observable
  int currentStep = 0;

  @observable
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @action
  void setFormKey(GlobalKey<FormState> value) => formKey = value;

  @action
  void setCurrentStep(int value) => currentStep = value;

  @action
  switchStepsType() {
    stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical;
  }

  @action
  void tapped(int step) {
    setCurrentStep(step);
  }

  @action
  void continued() {
    print(currentStep);
    currentStep < 3 ? setCurrentStep(currentStep + 1) : null;
  }

  @action
  void cancel() {
    currentStep > 0 ? setCurrentStep(currentStep - 1) : null;
  }

  @action
  void submitDetails(BuildContext context) {
    final FormState formState = formKey.currentState;

    if (!formState.validate()) {
      showSnackBarMessage(context, 'Verifique se os Dados estão corretos !');
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
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  new Text("FRANGO : " + data.frango),
                  new Text("FEIJAO : " + data.feijao),
                  SizedBox(
                    height: 10,
                  ),
                  Text('CONFECÇÃO DO DIA',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  new Text("FRANGO : " + data.frango_dia),
                  new Text("FEIJAO : " + data.feijao_dia),
                  SizedBox(
                    height: 10,
                  ),
                  Text('RECEBIMENTO',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  new Text("FRANGO : " + data.frango_rec),
                  new Text("FEIJAO : " + data.feijao_rec),
                  SizedBox(
                    height: 10,
                  ),
                  Text('DEBITOS PROGRAMADOS',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  new Text("COENTRO/CEBOLA/FARIHA : " + data.coent_ceb_far),
                  new Text("DIARISTA : " + data.diarista),
                  new Text("LIMPEZA : " + data.limpeza),
                  new Text("ÁGUA : " + data.agua),
                  new Text("EMBALAGEM : " + data.embalagem),
                  new Text("GÁS : " + data.gas),
                  new Text("FRETE : " + data.frete),
                  new Text("ÁCOOL : " + data.alcool),
                  new Text("\nTOTAL DE DESPESAS : R\$ ${getTotalDespesas()}"),
                  SizedBox(
                    height: 10,
                  ),
                  new Text(
                      "Data: ${DateFormat("d/M/yyyy HH:mm:ss").format(dateInfo)}"),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('Prosseguir'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CadastroSteep()));
                },
              ),
            ],
          ));
    }
  }

  @action
  void showSnackBarMessage(BuildContext context, String message,
      [MaterialColor color = Colors.red]) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(message)));
  }

  TableRow listaDeRow({
    String descricao,
    String quantidade,
    String valor,
    TextStyle style,
  }) {
    return TableRow(children: [
      Text(descricao, style: style),
      Text(quantidade, style: style),
      Text(valor, style: style),
    ]);
  }

  @action
  getTotalDespesas() =>
      double.parse(data.coent_ceb_far) +
      double.parse(data.diarista) +
      double.parse(data.limpeza) +
      double.parse(data.agua) +
      double.parse(data.embalagem) +
      double.parse(data.gas) +
      double.parse(data.frete) +
      double.parse(data.alcool);
}
