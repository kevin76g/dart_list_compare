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

//リストの値を変化させて何度か試してみてください
const List listMap1 = [
  {'id': 1, 'table': 'user'},
  {'id': 2, 'table': 'car'},
  {'id': 3, 'table': 'bike'}
];
const List listMap2 = [
  {'id': 2, 'table': 'car'},
  {'id': 3, 'table': 'bike'},
  {'id': 1, 'table': 'user'}
];

bool listCompare(List list1, List list2) {
  bool _isListEqual;

  Function unOrdDeepEq = const DeepCollectionEquality.unordered().equals;
  _isListEqual = unOrdDeepEq(list1, list2);

  return _isListEqual;
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'List 1 :\n' + listMap1.toString(),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'List 2 :\n' + listMap2.toString(),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'List comparison result is:',
            ),
            Text(
              listCompare(listMap1, listMap2).toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
