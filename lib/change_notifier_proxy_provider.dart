import 'package:basic_provider/create_update_proxy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//todo 2
class Counter with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}

//todo 3
class Translations with ChangeNotifier {
  late int value;

  void update(Counter counter) {
    value = counter.counter;
    notifyListeners();
  }

  String get title => 'You clicked $value times';
}

class ChangeNotifierProxyProviderExample extends StatefulWidget {
  const ChangeNotifierProxyProviderExample({super.key});

  @override
  State<ChangeNotifierProxyProviderExample> createState() =>
      _ChangeNotifierProxyProviderExampleState();
}

class _ChangeNotifierProxyProviderExampleState
    extends State<ChangeNotifierProxyProviderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Why ProxyProvider'),
      ),
      body: Center(
        child: MultiProvider(
          providers: [
            //todo 6 (finish)
            ChangeNotifierProvider<Counter>(
              create: (_) => Counter(),
            ),
            ChangeNotifierProxyProvider<Counter, Translations>(
              create: (_) => Translations(),
              update: (
                BuildContext _,
                Counter counter,
                Translations? translations,
              ) {
                translations!.update(counter);
                return translations;
              },
            ),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTranslations(), //todo 4
              const SizedBox(height: 20.0),
              IncreaseButton(), //todo 5
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
  const IncreaseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<Counter>().increment(),
      child: const Text(
        'INCREASE',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
