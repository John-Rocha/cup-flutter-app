import 'package:cup_flutter_app/app/core/ui/styles/button_styles.dart';
import 'package:cup_flutter_app/app/core/ui/widgets/button.dart';
import 'package:cup_flutter_app/app/core/ui/styles/text_styles.dart';
import 'package:cup_flutter_app/app/core/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: ButtonStyles.instance.primaryButton,
              onPressed: () {},
              child: const Text('Salvar'),
            ),
            OutlinedButton(
              style: ButtonStyles.instance.primaryOutlineButton,
              onPressed: () {},
              child: const Text('Salvar'),
            ),
            const TextField(),
            Button(
              style: ButtonStyles.instance.primaryButton,
              labelStyle: context.textStyles.textPrimaryFontBold,
              label: 'Salvar',
              onPressed: () {},
            ),
            RoundedButton(
              icon: Icons.add,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
