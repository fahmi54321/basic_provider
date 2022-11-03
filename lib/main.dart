import 'package:basic_provider/models/dog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {//
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //todo 3
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dog = Dog(name: 'dogs', breed: 'breed'); //todo 4

  @override
  void initState() { //todo 5
    super.initState();
    dog.addListener(dogListener);
  }

  void dogListener() { //todo 6
    print('age : ${dog.age}');
  }

  @override
  void dispose() { //todo 7
    dog.removeListener(dogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${dog.name}', //todo 8
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            BreedAndAge(dog: dog), //todo 9
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  final Dog dog; //todo 10
  const BreedAndAge({
    super.key,
    required this.dog,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed : ${dog.breed}', //todo 11
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        Age(dog: dog), // todo 12
      ],
    );
  }
}

class Age extends StatelessWidget {
  final Dog dog; //todo 13
  const Age({
    super.key,
    required this.dog,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age : ${dog.age}', //todo 14
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () => dog.grow(), //todo 15 (finish)
          child: const Text(
            'Grow',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        )
      ],
    );
  }
}
