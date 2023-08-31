import 'package:flutter/material.dart';

import '../../core/widgets/drawer/drawer_v1_widget.dart';
import '../bloc_pattern/bloc_pattern_page.dart';
import '../change_notifier/change_notifier_page.dart';
import '../value_notifer/value_notifer_page.dart';

class HomePageApp extends StatefulWidget {
  final String title;

  const HomePageApp({super.key, required this.title});

  @override
  State<HomePageApp> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<HomePageApp> {
  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerV1Widget(),
      appBar: AppBar(
        title: const Text('Home Page'),
        // backgroundColor: Colors.red[50],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/setstate_page');
              },
              child: const Text("setState")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/value_notifer_page');
                _goToPage(context, const ValueNotifierPage());
              },
              child: const Text("ValueNotifier")),
          ElevatedButton(
              onPressed: () {
                _goToPage(context, const ImgChangeNotifierPage());
              },
              child: const Text("ChangeNotofier")),
          ElevatedButton(
              onPressed: () {
                _goToPage(context, const ImcBlocPatternPage());
              },
              child: const Text("Bloc Pattern (Streams)")),
        ],
      )),
    );
  }
}
