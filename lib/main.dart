import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'componets/stepp.dart';
import 'controller/insertcontroller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  runApp(MyApp());
}

//Injeção de Dependencias
void setupLocators() {
  GetIt.I.registerSingleton<Inser>(Inser());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StepperDemo());
  }
}
