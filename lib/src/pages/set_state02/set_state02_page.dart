import 'package:flutter/material.dart';

import 'widgets/increment_button.dart';

class SetState02Page extends StatefulWidget {
  const SetState02Page({super.key});

  @override
  State<SetState02Page> createState() => SetState02PageState();
}

class SetState02PageState extends State<SetState02Page> {
  // publico
  int _counter = 0;

  void incrementCounter() {
    // publico
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set State - exemplo 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            const IncrementButton(),  // por ter const não precisar ser rebuildado
          ],
        ),
      ),
    );
  }
}
