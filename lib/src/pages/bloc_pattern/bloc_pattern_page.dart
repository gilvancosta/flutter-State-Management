import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/widgets/imc_gauge/imc_gauge.dart';
import 'controller/imc_bloc_pattern_controller.dart';
import 'class/imc_state.dart';

class ImcBlocPatternPage extends StatefulWidget {
  const ImcBlocPatternPage({super.key});

  @override
  State<ImcBlocPatternPage> createState() => _ImcBlocPatternPageState();
}

class _ImcBlocPatternPageState extends State<ImcBlocPatternPage> {
  final controller = ImcBlocPatternController();

  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();

  final formKey = GlobalKey<FormState>();
  //var imc = 0.0;

  @override
  void dispose() {
    controller.dispose();

    pesoEC.dispose();
    alturaEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora IMC 4 - Bloc Pattern'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // usa treamBuilder<ImcState para pegar o valor do imc
                  StreamBuilder<ImcState>(
                      stream: controller.imcOut,
                      builder: (context, snapshot) {
                        var imc = snapshot.data?.imc ?? 0;
                        return ImcGauge(imc: imc);
                      }),
                  // const ImcGauge(imc: 0),

                  // const ImcGauge(imc: 0),
                  const SizedBox(height: 20),
                  StreamBuilder<ImcState>(
                      stream: controller.imcOut,
                      builder: (context, snapshot) {
                        final datavalue = snapshot.data;

                        if (datavalue is ImcStateLoading) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (datavalue is ImcStateError) {
                          return Text(datavalue.message);
                        }

                        return const SizedBox.shrink();
                      }),
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
                        //    _calculateImc(peso: peso, altura: altura);
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
