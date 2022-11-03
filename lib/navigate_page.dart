import 'package:basic_provider/providers/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigatePage extends StatefulWidget {
  const NavigatePage({super.key});

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  @override
  Widget build(BuildContext context) {
    //todo 4 (finish)
    // error (markNeedsBuild....)
    // if (context.read<Counter>().counter == 3) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => OtherPage(),
    //     ),
    //   );
    // }

    //fix error
    if (context.read<Counter>().counter == 3) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtherPage(),
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Navigate'),
      ),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<Counter>().increment();
        },
      ),
    );
  }
}

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        child: Text(
          'Other',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
