import 'package:dw9_delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _showPassword = false;
  bool _showConfirmedPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao register usuário');
          },
          success: () {
            hideLoader();
            showSuccess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
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
                    decoration: const InputDecoration(labelText: 'Nome*'),
                    controller: _nameController,
                    validator: Validatorless.required('Nome obrigatório'),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-mail*'),
                    controller: _emailController,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha*',
                      suffixIcon: GestureDetector(
                        child: Icon(
                          _showPassword == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                    obscureText: _showPassword == false ? true : false,
                    controller: _passwordController,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória'),
                      Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirmar senha*',
                      suffixIcon: GestureDetector(
                        child: Icon(
                          _showConfirmedPassword == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onTap: () {
                          setState(() {
                            _showConfirmedPassword = !_showConfirmedPassword;
                          });
                        },
                      ),
                    ),
                    obscureText: _showConfirmedPassword == false ? true : false,
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório confirmar senha'),
                      Validatorless.compare(
                          _passwordController, 'Deve ser igual à senha'),
                    ]),
                  ),
                  const SizedBox(height: 50.0),
                  Center(
                    child: DeliveryButton(
                      width: double.infinity,
                      height: 47.0,
                      label: 'CADASTRAR',
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                            _nameController.text,
                            _emailController.text,
                            _passwordController.text,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
