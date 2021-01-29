import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  final String title;
  final Widget column;
  final int valueCurrentStep;

  const StepperDemo({Key key, this.title, this.column, this.valueCurrentStep})
      : super(key: key);
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: Text('${widget.title}'), //a
                    content: widget.column,
                    isActive: _currentStep >= 0,
                    state: _currentStep >= widget.valueCurrentStep
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    
    
    
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1): 2;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : 2;
  }



  
}
