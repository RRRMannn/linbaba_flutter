import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/* StatelessWidget 使用Scoped_model修改部件值 */
class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("StateManagementDemo"),
            elevation: 0,
          ),
          body: CounterWrapper(),
          floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context,_,model) =>FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: model.increaseCount,
            ),
          )),
    );
  }
}

/* StatefulWidget 使用InheritedWidget修改部件值 */
//class StateManagementDemo extends StatefulWidget {
//  @override
//  _StateManagementDemoState createState() => _StateManagementDemoState();
//}

//class _StateManagementDemoState extends State<StateManagementDemo> {
//  int _count = 0;
//
//  void _increaseCount() {
//    setState(() {
//      _count++;
//    });
//    print(_count);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return CounterProvider(
//      count: _count,
//      increaseCount: _increaseCount,
//      child: Scaffold(
//        appBar: AppBar(
//          centerTitle: true,
//          title: Text("StateManagementDemo"),
//          elevation: 0,
//        ),
//        body: CounterWrapper(),
//        floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.add),
//          onPressed: _increaseCount,
//        ),
//      ),
//    );
//  }
//}

class CounterWrapper extends StatelessWidget {
  CounterWrapper();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

/* StatefulWidget 使用InheritedWidget修改部件值对应的Counter */
//class Counter extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final int count = CounterProvider.of(context).count;
//    final VoidCallback increaseCount =
//        CounterProvider.of(context).increaseCount;
//
//    return ActionChip(
//      label: Text("$count"),
//      onPressed: increaseCount,
//    );
//  }
//}

/* StatelessWidget 使用Scoped_model修改部件值对应的Counter */
class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context,_,model)=>ActionChip(
        label: Text("${model.count}"),
        onPressed: model.increaseCount,
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;

  const CounterProvider({
    Key key,
    @required Widget child,
    this.count,
    this.increaseCount,
  })  : assert(child != null),
        super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterModel extends Model {
  int _count = 0;

  int get count => _count;

  void increaseCount() {
    _count++;
    debugPrint(_count.toString());
    notifyListeners();
  }
}
