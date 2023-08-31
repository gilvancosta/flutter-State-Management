// ignore_for_file: avoid_print

import 'dart:math';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/widgets/imc_gauge/imc_gauge.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({super.key});

  @override
  State<ValueNotifierPage> createState() => _SetStatePageState();
}

class _SetStatePageState extends State<ValueNotifierPage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var imc = ValueNotifier(0.0);

  Future<void> _calculateImc({required double peso, required double altura}) async {
    imc.value = 0;
    await Future.delayed(const Duration(seconds: 1));
    imc.value = peso / pow(altura, 2);
  }

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('----------------------------------------------------------');
    print('BUILD DE TELA - ValueNotifierPage === não é para chamar no calculo do IMC');
    print('----------------------------------------------------------');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora IMC 2 - ValueNotifier'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // =========== aqui usamos a class ValueListenableBuilder< ========
                  ValueListenableBuilder<double>(
                    // tipo do balor do imc
                    valueListenable: imc,
                    builder: (context, imcvalue, child) {
                      print('BUILD DE TELA 2- ValueNotifierPage');
                      return ImcGauge(imc: imcvalue);
                    },
                  ),
                  // =========== ImcGauge ========

                  const SizedBox(height: 20),
                  TextFormField(
                      controller: pesoEC,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Peso',
                      ),
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          locale: 'pt_BR',
                          symbol: '',
                          decimalDigits: 2,
                          turnOffGrouping: true,
                          // CustomPattern: '###.0#',)
                        ),
                      ],
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe o peso';
                        }
                        return null;
                      }),
                  TextFormField(
                      controller: alturaEC,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Altura',
                      ),
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          locale: 'pt_BR',
                          symbol: '',
                          decimalDigits: 2,
                          turnOffGrouping: true,
                          // CustomPattern: '###.0#',)
                        ),
                      ],
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe a altura';
                        }
                        return null;
                      }),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      var formValid = formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        var formatter = NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);
                        double peso = formatter.parse(pesoEC.text).toDouble();
                        double altura = formatter.parse(alturaEC.text).toDouble();
                        _calculateImc(peso: peso, altura: altura);
                      }
                    },
                    child: const Text('Calcular IMC'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
