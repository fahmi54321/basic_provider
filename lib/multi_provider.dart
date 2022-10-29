import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//todo 2
class Transalations {
  Transalations(this.value);
  int value;

  String get title => 'You clicked $value times';
}

class MultiProviders extends StatefulWidget {
  const MultiProviders({super.key});

  @override
  State<MultiProviders> createState() => _MultiProvidersState();
}

class _MultiProvidersState extends State<MultiProviders> {
  //todo 3
  int counter = 0;

  //todo 4
  void increment() {
    setState(() {
      counter++;
      print('counter : $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Why ProxyProvider'),
      ),
      body: Center(
        child: MultiProvider(
          //todo 7
          providers: [
            ProxyProvider0<int>(update: (_, __) => counter),
            ProxyProvider<int, Transalations>(
              update: (_, value, __) => Transalations(value),
            ),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTranslations(), //todo 5
              const SizedBox(height: 20.0),
              IncreaseButton(increment: increment), //todo 6
            ],
          ),
        ),
      ),
    );
  }
}

class ShowTranslations extends StatelessWidget {
  const ShowTranslations({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.watch<Transalations>().title; //todo 8 (finish)
    return Text(
      '$title',
      style: TextStyle(fontSize: 28.0),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  final VoidCallback increment;
  const IncreaseButton({
    super.key,
    required this.increment,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: increment,
      child: const Text(
        'INCREASE',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
