import 'package:flutter/material.dart';

class DrawerV1Widget extends StatelessWidget {
  const DrawerV1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountEmail: Text("suporte@comsuporte.com.br"),
            accountName: Text("COMSUPORTE"),
            currentAccountPicture: CircleAvatar(
              child: Text("CS"),
            ),
          ),
          // -- widget_page --
          ListTile(
              leading: const Icon(Icons.calculate_rounded),
              title: const Text('Calculadora IMC 1'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/imc_calculator');
                // Navigator.pop(context);
              }),
          ListTile(
              leading: const Icon(Icons.calculate_rounded),
              title: const Text('Calculadora IMC 2'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/value_notifer_page');
                // Navigator.pop(context);
              }),
          ListTile(
              leading: const Icon(Icons.calculate_rounded),
              title: const Text('Calculadora IMC 3'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/change_notifier_page');
                // Navigator.pop(context);
              }),
          ListTile(
              leading: const Icon(Icons.calculate_rounded),
              title: const Text('Calculadora IMC 4'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/imc_bloc_pattern_page');
                // Navigator.pop(context);
              }),
          // -- images_page --
        ],
      ),
    );
  }
}
