import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pdc/controller/insertcontroller.dart';
import 'package:pdc/models/stepp_models.dart';

class StepperDemo extends StatefulWidget {
  final StepperType stepperType;
  final int currentStep;
  final Function(int) onStepTapped;
  final void Function() onStepContinue;
  final void Function() onStepCancel;

  const StepperDemo(
      {Key key,
      this.stepperType,
      this.currentStep,
      this.onStepTapped,
      this.onStepContinue,
      this.onStepCancel})
      : super(key: key);
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  final controllerInsert = GetIt.I<InsertStore>();

  static var _focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      print('Has focus: ${_focusNode.hasFocus}');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Stepper(
        type: widget.stepperType,
        physics: ScrollPhysics(),
        currentStep: widget.currentStep,
        onStepTapped: widget.onStepTapped,
        onStepContinue: widget.onStepContinue,
        onStepCancel: controllerInsert.cancel,
        steps: listaSteps(),
      );
    });
  }

  List<Step> listaSteps() {
    List<Step> steps = [
      new Step(
          title: const Text('SALDO ANTERIOR'),
          isActive: true,
          state: StepState.indexed,
          content: Observer(builder: (_) {
            return Column(
              children: [
                TextFormField(
                  initialValue: controllerInsert.data.frango,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String value) {
                    //VALOR QUE VAI SUBSTITUIR O VALOR DA API

                    controllerInsert.data.frango = value;
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'FRANGO',
                      hintText:
                          controllerInsert.data.frango, //Valor que vem da API
                      //filled: true,
                      icon: const Icon(Icons.food_bank),
                      labelStyle: new TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                ),
                TextFormField(
                  initialValue: controllerInsert.data.feijao,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String value) {
                    //VALOR QUE VAI SUBSTITUIR O VALOR DA API
                    controllerInsert.data.feijao = value;
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'FEIJAO',
                      hintText:
                          controllerInsert.data.feijao, //Valor que vem da API
                      //filled: true,
                      icon: const Icon(Icons.grain),
                      labelStyle: new TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )
              ],
            );
          })),
      new Step(
          title: const Text('CONFECÇÃO DO DIA'),
          isActive: true,
          state: StepState.indexed,
          content: Observer(builder: (_) {
            return Column(
              children: [
                TextFormField(
                  initialValue: controllerInsert.data.frango_dia,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String value) {
                    //VALOR QUE VAI SUBSTITUIR O VALOR DA API

                    value = controllerInsert.data.frango_dia;
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'FRANGO',
                      hintText: controllerInsert
                          .data.frango_dia, //Valor que vem da API
                      //filled: true,
                      icon: const Icon(Icons.food_bank),
                      labelStyle: new TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                ),
                TextFormField(
                  initialValue: controllerInsert.data.feijao_dia,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String value) {
                    //VALOR QUE VAI SUBSTITUIR O VALOR DA API
                    value = controllerInsert.data.feijao_dia;
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'FEIJAO',
                      hintText: controllerInsert.data.feijao_dia,
                      //Valor que vem da API
                      icon: const Icon(Icons.grain),
                      labelStyle: new TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )
              ],
            );
          })),
      new Step(
          title: const Text('RECEBIMENTO'),
          isActive: true,
          state: StepState.indexed,
          content: Observer(builder: (_) {
            return Column(
              children: [
                TextFormField(
                  initialValue: controllerInsert.data.frango_rec,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String value) {
                    //VALOR QUE VAI SUBSTITUIR O VALOR DA API

                    controllerInsert.data.frango_rec = value;
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'FRANGO',
                      hintText: controllerInsert
                          .data.frango_rec, //Valor que vem da API
                      //filled: true,
                      icon: const Icon(Icons.food_bank),
                      labelStyle: new TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                ),
                TextFormField(
                  initialValue: controllerInsert.data.feijao_rec,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String value) {
                    //VALOR QUE VAI SUBSTITUIR O VALOR DA API
                    controllerInsert.data.feijao_rec = value;
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: 'FEIJAO',
                      hintText: controllerInsert
                          .data.feijao_rec, //Valor que vem da API
                      //filled: true,
                      icon: const Icon(Icons.grain),
                      labelStyle: new TextStyle(
                          decorationStyle: TextDecorationStyle.solid)),
                )
              ],
            );
          })),
      new Step(
          title: const Text('DEBITOS PROGRAMADOS'),
          isActive: true,
          state: StepState.indexed,
          content: Observer(builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Table(
                  border: TableBorder.all(color: Colors.red),
                  children: [
                    controllerInsert.listaDeRow(
                      descricao: ' DESCRIÇÃO',
                      quantidade: ' QTD',
                      valor: ' VALOR',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    controllerInsert.listaDeRow(
                      descricao: '  COENTRO + CEBOLA\n  + FARINHA',
                      quantidade: ' ${controllerInsert.data.coent_ceb_far_qtd}',
                      valor: ' R\$ ${controllerInsert.data.coent_ceb_far}',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    controllerInsert.listaDeRow(
                      descricao: '  DIARISTA',
                      quantidade: ' ${controllerInsert.data.diarista_qtd}',
                      valor: ' R\$ ${controllerInsert.data.diarista}',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    controllerInsert.listaDeRow(
                      descricao: '  LIMPEZA',
                      quantidade: ' ${controllerInsert.data.limpeza_qtd}',
                      valor: ' R\$ ${controllerInsert.data.limpeza}',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    controllerInsert.listaDeRow(
                      descricao: '  ÁGUA',
                      quantidade: ' ${controllerInsert.data.agua_qtd}',
                      valor: ' R\$ ${controllerInsert.data.agua}',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    controllerInsert.listaDeRow(
                      descricao: '  EMBALAGEM',
                      quantidade: ' ${controllerInsert.data.embalagem_qtd}',
                      valor: ' R\$ ${controllerInsert.data.embalagem}',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    controllerInsert.listaDeRow(
                      descricao: '  GÁS',
                      quantidade: ' ${controllerInsert.data.gas_qtd}',
                      valor: ' R\$ ${controllerInsert.data.gas}',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    controllerInsert.listaDeRow(
                      descricao: '  FRETE',
                      quantidade: ' ${controllerInsert.data.frete_qtd}',
                      valor: ' R\$ ${controllerInsert.data.frete}',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                    controllerInsert.listaDeRow(
                      descricao: '  ÁLCOOL',
                      quantidade: ' ${controllerInsert.data.alcool_qtd}',
                      valor: ' R\$ ${controllerInsert.data.alcool}',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              ],
            );
          })),
    ];
    return steps;
  }
}
