import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//todo 2
class Transalations {
  late int value;

  void update(int newValue) {
    value = newValue;
  }

  String get title => 'You clicked $value times';
}

class CreateUpdateProxyProvider extends StatefulWidget {
  const CreateUpdateProxyProvider({super.key});

  @override
  State<CreateUpdateProxyProvider> createState() =>
      _CreateUpdateProxyProviderState();
}

class _CreateUpdateProxyProviderState extends State<CreateUpdateProxyProvider> {
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
        child: ProxyProvider0<Transalations>(
          create: (_) => Transalations(), //todo 7
          update: (_, Transalations? transalations) {
            //todo 8 (finish)
            transalations?.update(counter);
            return transalations!;
          },
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
    final title = context.watch<Transalations>().title;
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
