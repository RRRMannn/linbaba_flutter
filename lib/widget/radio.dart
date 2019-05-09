import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RadioDemoState();
  }
}

class RadioDemoState extends State<RadioDemo>{

  int _radioGroupA =0;

  void _handlerRadioValueChanged(int value) {
    setState(() {
      _radioGroupA=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("RadioDemo"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("RadioGroupValue: $_radioGroupA"),
            SizedBox(height: 16,),
            RadioListTile(
              value: 0,
              groupValue: _radioGroupA,
              onChanged: _handlerRadioValueChanged,
              title: Text("Option A"),
              subtitle: Text("Description"),
              secondary: Icon(Icons.filter_1),
              selected: _radioGroupA==0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioGroupA,
              onChanged: _handlerRadioValueChanged,
              title: Text("Option B"),
              subtitle: Text("Description"),
              secondary: Icon(Icons.filter_2),
              selected: _radioGroupA==1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Radio(
//                  value: 0,
//                  groupValue: _radioGroupA,
//                  onChanged: _handlerRadioValueChanged,
//                ),
//                Radio(
//                  value: 1,
//                  groupValue: _radioGroupA,
//                  onChanged: _handlerRadioValueChanged,
//                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}