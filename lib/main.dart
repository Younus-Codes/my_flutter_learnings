import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_learnings/Screen/DioRequest.dart';
import 'package:my_learnings/Screen/Movies_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  StreamController<String> _streamController = StreamController<String>();

  late Stream<String> _stream;

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _stream = _streamController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Container(
            child: MovieScreen(),
          ),
          //DioRequest(),
        ));
  }
}

// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// StreamBuilder<String>(
// stream: _stream,
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// return Text(snapshot.data!,
// style: Theme.of(context).textTheme.headline4);
// } else {
// return Text('No data',
// style: Theme.of(context).textTheme.headline4);
// }
// }),
// StreamBuilder<String>(
// stream: _stream,
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// return Text(snapshot.data!,
// style: Theme.of(context).textTheme.headline4);
// } else {
// return Text('No data',
// style: Theme.of(context).textTheme.headline4);
// }
// }),
// SizedBox(height: 20),
// TextField(
// controller: _textEditingController,
// decoration: InputDecoration(
// border: OutlineInputBorder(),
// labelText: 'Enter your name',
// ),
// ),
// SizedBox(height: 20),
// ElevatedButton(
// onPressed: () {
// _streamController.add(_textEditingController.text);
// },
// child: Text('Submit'),
// ),
// ],
// ),
