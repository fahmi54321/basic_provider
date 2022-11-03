import 'package:basic_provider/providers/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HandleDialogPage extends StatefulWidget {
  const HandleDialogPage({super.key});

  @override
  State<HandleDialogPage> createState() => _HandleDialogPageState();
}

class _HandleDialogPageState extends State<HandleDialogPage> {
  //todo 2
  @override
  void initState() {
    super.initState();

    // error dependOnInheritedWidgetOfExactType.....
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         content: Text('Be careful'),
    //       );
    //     });

    // fix error
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Be careful'),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    //todo 3 (next navigate_page.dart)

    //error (markNeedsBuild....)
    // if (context.read<Counter>().counter == 3) {
    //   showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           content: Text('Count is 3'),
    //         );
    //       });
    // }

    // fix error
    if (context.watch<Counter>().counter == 3) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Count is 3'),
              );
            });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Handle Dialog'),
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
