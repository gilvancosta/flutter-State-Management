import 'dart:math';

import 'package:flutter/material.dart';

class ImcChangeNotifierController extends ChangeNotifier {
  var imc = 0.0;

  Future<void> calcularImc({required double peso, required double altura}) async {
    imc = 0.0;
    notifyListeners(); // para zerar o ponteiro

    await Future.delayed(const Duration(seconds: 1));

    imc = peso / pow(altura, 2);

    notifyListeners();

  }
}
