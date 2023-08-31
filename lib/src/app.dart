// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'core/ui/theme/app_theme.dart';
import 'core/utls/app_routes.dart';
import 'pages/bloc_pattern/bloc_pattern_page.dart';
import 'pages/change_notifier/change_notifier_page.dart';
import 'pages/home/home_page.dart';
import 'pages/set_state/set_state_page.dart';
import 'pages/value_notifer/value_notifer_page.dart';

class MyApp extends StatefulWidget {
  final String title;
  const MyApp({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
      theme: MyAppTheme.themeData,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (ctx) => HomePageApp(title: widget.title),
        '/setstate_page': (_) => const SetStatePage(),
        // '/imc_calculator': (_) => const ImcCalculatorPage(),
        '/value_notifer_page': (_) => const ValueNotifierPage(),
       '/change_notifier_page': (_) => const ImgChangeNotifierPage(),
      '/imc_bloc_pattern_page': (_) => const ImcBlocPatternPage(),
      },

      onGenerateRoute: (settings) {
        if (settings.name == '/alguma-coisa') {
          return null;
        } else if (settings.name == '/outra-coisa') {
          return null;
        } else {
          return MaterialPageRoute(builder: (_) {
            return HomePageApp(title: widget.title);
          });
        }
      },
      // funciona tipo fosse uma página 404
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return HomePageApp(title: widget.title);
        });
      },
    );
  }
}
