// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insertcontroller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InsertStore on _InsertStoreBase, Store {
  final _$dataAtom = Atom(name: '_InsertStoreBase.data');

  @override
  MyData get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(MyData value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$dateInfoAtom = Atom(name: '_InsertStoreBase.dateInfo');

  @override
  DateTime get dateInfo {
    _$dateInfoAtom.reportRead();
    return super.dateInfo;
  }

  @override
  set dateInfo(DateTime value) {
    _$dateInfoAtom.reportWrite(value, super.dateInfo, () {
      super.dateInfo = value;
    });
  }

  final _$stepperTypeAtom = Atom(name: '_InsertStoreBase.stepperType');

  @override
  StepperType get stepperType {
    _$stepperTypeAtom.reportRead();
    return super.stepperType;
  }

  @override
  set stepperType(StepperType value) {
    _$stepperTypeAtom.reportWrite(value, super.stepperType, () {
      super.stepperType = value;
    });
  }

  final _$currentStepAtom = Atom(name: '_InsertStoreBase.currentStep');

  @override
  int get currentStep {
    _$currentStepAtom.reportRead();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.reportWrite(value, super.currentStep, () {
      super.currentStep = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_InsertStoreBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$_InsertStoreBaseActionController =
      ActionController(name: '_InsertStoreBase');

  @override
  void setDateInfo(DateTime value) {
    final _$actionInfo = _$_InsertStoreBaseActionController.startAction(
        name: '_InsertStoreBase.setDateInfo');
    try {
      return super.setDateInfo(value);
    } finally {
      _$_InsertStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFormKey(GlobalKey<FormState> value) {
    final _$actionInfo = _$_InsertStoreBaseActionController.startAction(
        name: '_InsertStoreBase.setFormKey');
    try {
      return super.setFormKey(value);
    } finally {
      _$_InsertStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentStep(int value) {
    final _$actionInfo = _$_InsertStoreBaseActionController.startAction(
        name: '_InsertStoreBase.setCurrentStep');
    try {
      return super.setCurrentStep(value);
    } finally {
      _$_InsertStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic switchStepsType() {
    final _$actionInfo = _$_InsertStoreBaseActionController.startAction(
        name: '_InsertStoreBase.switchStepsType');
    try {
      return super.switchStepsType();
    } finally {
      _$_InsertStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tapped(int step) {
    final _$actionInfo = _$_InsertStoreBaseActionController.startAction(
        name: '_InsertStoreBase.tapped');
    try {
      return super.tapped(step);
    } finally {
      _$_InsertStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void continued() {
    final _$actionInfo = _$_InsertStoreBaseActionController.startAction(
        name: '_InsertStoreBase.continued');
    try {
      return super.continued();
    } finally {
      _$_InsertStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancel() {
    final _$actionInfo = _$_InsertStoreBaseActionController.startAction(
        name: '_InsertStoreBase.cancel');
    try {
      return super.cancel();
    } finally {
      _$_InsertStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submitDetails(BuildContext context) {
    final _$actionInfo = _$_InsertStoreBaseActionController.startAction(
        name: '_InsertStoreBase.submitDetails');
    try {
      return super.submitDetails(context);
    } finally {
      _$_InsertStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showSnackBarMessage(BuildContext context, String message,
      [MaterialColor color = Colors.red]) {
    final _$actionInfo = _$_InsertStoreBaseActionController.startAction(
        name: '_InsertStoreBase.showSnackBarMessage');
    try {
      return super.showSnackBarMessage(context, message, color);
    } finally {
      _$_InsertStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTotalDespesas() {
    final _$actionInfo = _$_InsertStoreBaseActionController.startAction(
        name: '_InsertStoreBase.getTotalDespesas');
    try {
      return super.getTotalDespesas();
    } finally {
      _$_InsertStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
dateInfo: ${dateInfo},
stepperType: ${stepperType},
currentStep: ${currentStep},
formKey: ${formKey}
    ''';
  }
}
