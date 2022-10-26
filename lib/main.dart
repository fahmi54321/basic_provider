import 'package:basic_provider/counter.dart';
import 'package:basic_provider/show_me_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        //todo 2
        create: (context) => Counter(),
        child: MyHomePage(),
      ),
    );
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
                //todo 4 (finish)

                //error 1
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ShowMeCounter(),
                //   ),
                // );

                //error 2
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ChangeNotifierProvider.value(
                //       value: context.read<Counter>(),
                //       child: ShowMeCounter(),
                //     ),
                //   ),
                // );

                // tidak error
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (counterContext) => ChangeNotifierProvider.value(
                      value: context.read<Counter>(),
                      child: ShowMeCounter(),
                    ),
                  ),
                );
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
                context.read<Counter>().increment(); //todo 3
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
