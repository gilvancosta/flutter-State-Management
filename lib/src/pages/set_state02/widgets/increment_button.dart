// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../set_state02_page.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //  ButtonWidget(),

        IconButton(
          onPressed: () {
            context.findAncestorStateOfType<SetState02PageState>()?.incrementCounter();
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.findAncestorStateOfType<SetState02PageState>()?.incrementCounter();
      },
      icon: const Icon(Icons.add),
    );
  }
}
