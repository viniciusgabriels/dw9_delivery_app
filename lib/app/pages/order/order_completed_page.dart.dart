import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: context.percentHeight(.2)),
              Image.asset('assets/images/logo_rounded.png'),
              const SizedBox(height: 25.0),
              Text(
                'Pedido realizado com sucesso, em breve você receberá a confirmação do seu pedido',
                textAlign: TextAlign.center,
                style: context.textStyles.textExtraBold.copyWith(
                  fontSize: 18,
                  color: const Color(0xFF00333E),
                ),
              ),
              const SizedBox(height: 40.0),
              DeliveryButton(
                label: 'FECHAR',
                width: context.percentWidth(.8),
                height: 48.0,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
