import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//todo 2
class Transalations {
  const Transalations(this.value);
  final int value;

  String get title => 'You clicked $value times';
}

class WhyProxyProvider extends StatefulWidget {
  const WhyProxyProvider({super.key});

  @override
  State<WhyProxyProvider> createState() => _WhyProxyProviderState();
}

class _WhyProxyProviderState extends State<WhyProxyProvider> {
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
        //todo 8 (memakai provider aja, value tidak ke update ke screen)
        //       (karena di Translations gak ada change notifier)

        // child: Provider(
        //   create: (_) => Transalations(counter),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       ShowTranslations(),
        //       const SizedBox(height: 20.0),
        //       IncreaseButton(increment: increment),
        //     ],
        //   ),
        // ),

        // todo 9 (dengan proxy peovider bisa update dengan bantuan params update)
        //        (finish)
        child: ProxyProvider0(
          update: (_, __) => Transalations(counter),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTranslations(), //tod0 5
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
    final title = Provider.of<Transalations>(context).title;
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
