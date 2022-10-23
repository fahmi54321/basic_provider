import 'package:basic_provider/models/babies.dart';
import 'package:basic_provider/models/dog.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Dog(name: 'dog', breed: 'breed'),
        ),
        FutureProvider(
          initialData: 0,
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            final babies = Babies(age: dogAge);
            return babies.getBabies();
          },
        ),
        StreamProvider(
            create: (context) {
              final int dogAge = context.read<Dog>().age;
              final babies = Babies(age: dogAge * 2);
              return babies.bark();
            },
            initialData: 'Bark 0 times')
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
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
      body: Consumer(builder: (BuildContext context, Dog dog, _) {
        //todo 1
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '- name: ${dog.name}', //todo 2
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              BreedAndAge(),
            ],
          ),
        );
      }),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, Dog dog, _) {
      //todo 3
      return Column(
        children: [
          Text(
            '- breed : ${dog.breed}', //todo 4
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 10.0),
          Age(),
        ],
      );
    });
  }
}

class Age extends StatelessWidget {
  const Age({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, Dog dog, _) {
      //todo 5
      return Column(
        children: [
          Text(
            '- age : ${dog.age}', //todo 6
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => dog.grow(), //todo 7 (finish)
            // onPressed: () => dog.grow(),
            child: const Text(
              'Grow',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          )
        ],
      );
    });
  }
}
