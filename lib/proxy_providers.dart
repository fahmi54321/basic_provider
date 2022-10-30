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
  Translations(this.value);
  final int value;

  String get title => 'You clicked $value times';
}

class ProxyProviderExample extends StatefulWidget {
  const ProxyProviderExample({super.key});

  @override
  State<ProxyProviderExample> createState() => _ProxyProviderExampleState();
}

class _ProxyProviderExampleState extends State<ProxyProviderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Why ProxyProvider'),
      ),
      body: Center(
        child: MultiProvider(
          providers: [
            //todo 3 (finish)
            ChangeNotifierProvider<Counter>(
              create: (_) => Counter(),
            ),
            ProxyProvider<Counter, Translations>(
              update: (_, counter, __) => Translations(
                counter.counter,
              ),
            ),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTranslations(),
              const SizedBox(height: 20.0),
              IncreaseButton(),
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
