import 'package:basic_provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          style: TextStyle(fontSize: 52.0),
        ),
      ),
    );
  }
}
