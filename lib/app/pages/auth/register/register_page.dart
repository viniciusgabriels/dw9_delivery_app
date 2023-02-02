import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textStyles.textTitle,
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Preencha os campos abaixo para criar o  seu cadastro.',
                  style: context.textStyles.textMedium.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome*',
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail*',
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Senha*',
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Confirmar senha*',
                  ),
                ),
                const SizedBox(height: 50.0),
                Center(
                  child: DeliveryButton(
                    width: double.infinity,
                    height: 47.0,
                    label: 'CADASTRAR',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
