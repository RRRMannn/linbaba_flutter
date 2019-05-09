import 'package:flutter/material.dart';
import 'package:linbaba_flutter/widget/buttons.dart';
import 'package:linbaba_flutter/widget/floatingbutton.dart';
import 'package:linbaba_flutter/widget/popupmenubutton.dart';
import 'package:linbaba_flutter/widget/form.dart';
import 'package:linbaba_flutter/widget/checkbox.dart';
import 'package:linbaba_flutter/widget/radio.dart';
import 'package:linbaba_flutter/widget/switch.dart';
import 'package:linbaba_flutter/widget/slider.dart';
import 'package:linbaba_flutter/widget/datetime.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MaterialComponents"),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "DateTime",
            page: DateTimeDemo(),
          ),
          ListItem(
            title: "Slider",
            page: SliderDemo(),
          ),
          ListItem(
            title: "Switch",
            page: SwitchDemo(),
          ),
          ListItem(
            title: "Radio",
            page: RadioDemo(),
          ),
          ListItem(
            title: "Checkbox",
            page: CheckboxDemo(),
          ),
          ListItem(
            title: "Form",
            page: FormDemo(),
          ),
          ListItem(
            title: "PopupMenuButton",
            page: PopupMenuButtonDemo(),
          ),
          ListItem(
            title: "Button",
            page: ButtonDemo(),
          ),
          ListItem(
            title: "FloatingActionButton",
            page: FloatingActionButtonDemo(),
          )
        ],
      ),
    );
  }
}

class _WidgeDemo extends StatelessWidget {
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
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
