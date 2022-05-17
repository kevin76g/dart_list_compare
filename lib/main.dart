import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Compare Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'List Compare Demonstration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool listCompare() {
    bool _isListEqual;

    //リストの値を変化させて何度か試してみてください
    List listMap1 = [
      {'a': 1, 'b': 1},
      {'a': 2, 'b': 2},
      {'a': 3, 'b': 3}
    ];
    List listMap2 = [
      {'a': 3, 'b': 3},
      {'a': 2, 'b': 2},
      {'a': 1, 'b': 1}
    ];

    Function unOrdDeepEq = const DeepCollectionEquality.unordered().equals;
    _isListEqual = unOrdDeepEq(listMap1, listMap2);

    if (kDebugMode) {
      print(_isListEqual);
    } //=>true

    return _isListEqual;
  }

  @override
  Widget build(BuildContext context) {
    var _isListEqual = listCompare();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'List comparison result is:',
            ),
            Text(
              _isListEqual.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _isListEqual = listCompare();
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
