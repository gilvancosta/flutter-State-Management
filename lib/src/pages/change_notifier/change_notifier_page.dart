// ignore_for_file: avoid_print
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/widgets/imc_gauge/imc_gauge.dart';
import 'NotifierController/change_notifier_controller.dart';


class ImgChangeNotifierPage extends StatefulWidget {
  const ImgChangeNotifierPage({super.key});

  @override
  State<ImgChangeNotifierPage> createState() => _ImgChangeNotifierPageState();
}

class _ImgChangeNotifierPageState extends State<ImgChangeNotifierPage> {

  final controller = ImcChangeNotifierController();

  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  // var imc = 0.0;

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('----------------------------------------------------------');
    print('BUILD DE TELA - ImgChangeNotifierPage');
    print('----------------------------------------------------------');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora IMC 3 - ChangeNotifier'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  // =========== aqui Usamos a class AnimatedBuilder  ========
                  AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        print('---- AnimatedBuilder ----');
                        return ImcGauge(
                          imc: controller.imc,
                        );
                      }),
                      
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

                        controller.calcularImc(peso: peso, altura: altura);
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
