import 'package:basic_provider/counter.dart';
import 'package:basic_provider/show_me_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});//

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        //todo 1
        create: (context) => Counter(),
        child: MyHomePage(),
      ),

      //todo 3

      // error
      // routes: {
      //   '/': (context) => MyHomePage(),
      //   'counter': (context) => ShowMeCounter(),
      // },

      // tidak error
      routes: {
        '/': (context) => ChangeNotifierProvider.value(
              value: _counter,
              child: MyHomePage(),
            ),
        'counter': (context) => ChangeNotifierProvider.value(
              value: _counter,
              child: ShowMeCounter(),
            ),
      },
    );
  }

  // todo 4 (finish)
  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'counter'); //todo 2
              },
              child: const Text(
                'Show Me Counter',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: const Text(
                'Increment Counter',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
