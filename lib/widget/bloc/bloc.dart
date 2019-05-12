import 'package:flutter/material.dart';

import 'counterbloc.dart';

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BlocDemo"),
          elevation: 0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
      bloc: CounterBloc(),
    );
  }
}

