import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SliderDemoState();
  }
}

class SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("_WidgeDemo"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,                      //分成10段
                  label: '${_sliderItemA.toInt()}',   //展示当前value
                  value: _sliderItemA,
                  onChanged: (value) {
                    setState(() {
                      _sliderItemA = value;
                    });
                  },
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey.withOpacity(0.3),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text("SliderValue:$_sliderItemA")
          ],
        ),
      ),
    );
  }
}
