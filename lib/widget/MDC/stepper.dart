import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _curentStep=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("StepperDemo"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.black),
              child: Stepper(
                currentStep: _curentStep,
                onStepTapped: (int value){
                  setState(() {
                    _curentStep=value;
                  });
                },
                onStepContinue: (){
                  if(_curentStep!=2){
                    setState(() {
                      _curentStep++;
                    });
                  }
                },
                onStepCancel: (){
                  if(_curentStep!=0){
                    setState(() {
                      _curentStep--;
                    });
                  }
                },
                steps: [
                  Step(
                      title: Text("Login"),
                      subtitle: Text("Login first"),
                      content: Text("详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述"),
                      isActive: _curentStep==0
                  ),Step(
                      title: Text("Login"),
                      subtitle: Text("Login first"),
                      content: Text("详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述"),
                      isActive: _curentStep==1
                  ),Step(
                      title: Text("Login"),
                      subtitle: Text("Login first"),
                      content: Text("详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述详细的步骤描述"),
                      isActive: _curentStep==2
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
