import 'package:flutter/material.dart';

class chipDemo extends StatefulWidget {
  @override
  _chipDemoState createState() => _chipDemoState();
}

class _chipDemoState extends State<chipDemo> {

  String _action;

  String _choice="Lemon";

  List<String> _selected=[];

  List<String> _tags = [
    'Apple',
    'Bananer',
    'Lemon',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ChipDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              runSpacing: 8,      //行与行之间的间隔
              spacing: 8,         //小部件之间的间隔
              children: <Widget>[
                Chip(
                  label: Text("标签"),
                ),
                Chip(
                  label: Text("标标签"),
                  backgroundColor: Colors.blueGrey,
                ),
                Chip(
                  label: Text("广东幸福叮咚"),
                  backgroundColor: Colors.blueAccent,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text("狗"),
                  ),
                ),
                Chip(
                  label: Text("China"),
                  backgroundColor: Colors.blueAccent,
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage("http://a088.xyz/images/portfolio/0mmexport1554196894459.jpg"),
                  ),
                ),
                Chip(
                  label: Text("China"),
                  onDeleted: (){debugPrint("删除标签！");},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.blue,
                  deleteButtonTooltipMessage: "Remove this tag",
                ),

                //chip删除例子
                Wrap(
                  children: <Widget>[
                    Divider(
                      color: Colors.blueGrey,
                      height: 32.0,
                    ),
                    Wrap(
                      spacing: 8,
                      children: _tags.map(
                              (tag){
                            return Chip(
                              label: Text(tag),
                              onDeleted: (){
                                setState(() {
                                  _tags.remove(tag);
                                });
                              },
                            );
                          }
                      ).toList(),
                    ),
                  ],
                ),

                //ActionChip例子,为chip添加动作
                Wrap(
                  children: <Widget>[
                    Divider(
                      color: Colors.blueGrey,
                      height: 32.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text("Action $_action"),
                    ),
                    Wrap(
                      spacing: 8,
                      children: _tags.map(
                              (tag){
                            return ActionChip(
                              label: Text(tag),
                              onPressed: (){
                                setState(() {
                                  _action=tag;
                                });
                              },
                            );
                          }
                      ).toList(),
                    )
                  ],
                ),

                //FilterChip例子，为chip添加选择，可多选
                Wrap(
                  children: <Widget>[
                    Divider(
                      color: Colors.blueGrey,
                      height: 32.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text("FilterChip ${_selected.toString()}"),
                    ),
                    Wrap(
                      spacing: 8,
                      children: _tags.map(
                              (tag){
                            return FilterChip(
                              label: Text(tag),
                              selected: _selected.contains(tag),
                              onSelected: (value){
                                setState(() {
                                  if(_selected.contains(tag)){
                                    _selected.remove(tag);
                                  }else{
                                    _selected.add(tag);
                                  }
                                });
                              },
                            );
                          }
                      ).toList(),
                    )
                  ],
                ),

                //ChoiceChip例子，为chip添加选择，可多选
                Wrap(
                  children: <Widget>[
                    Divider(
                      color: Colors.blueGrey,
                      height: 32.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text("ChoiceChip ${_choice}"),
                    ),
                    Wrap(
                      spacing: 8,
                      children: _tags.map(
                              (tag){
                            return ChoiceChip(
                              label: Text(tag),
                              selected: _choice==tag,
                              onSelected: (value){
                                setState(() {
                                  _choice=tag;
                                });
                              },
                              selectedColor: Colors.blueGrey,
                            );
                          }
                      ).toList(),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: (){
          setState(() {
            _tags = [
              'Apple',
              'Bananer',
              'Lemon',
            ];
            _selected=[];
            _choice="Lemon";
          });
        },
      ),
    );
  }
}

