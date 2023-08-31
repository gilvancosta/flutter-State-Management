import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import '../../core/widgets/imc_gauge/imc_gauge.dart';

class SetStatePage extends StatefulWidget {
  const SetStatePage({super.key});

  @override
  State<SetStatePage> createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var imc = 0.0;

  Future<void> _calculateImc({required double peso, required double altura}) async {
    setState(() {
      imc = 0;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      imc = peso / pow(altura, 2);
    });
  }

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('BUILD SETSTATE PAGE'); // Para verficar que o build é chamado a cada setState

    return Scaffold(
        appBar: AppBar(
          title: const Text('IMC com setState'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // =========== ImcGauge ========
                  ImcGauge(imc: imc),
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
