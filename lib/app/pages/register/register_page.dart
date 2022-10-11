// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cup_flutter_app/app/pages/register/view/register_view_impl.dart';
import 'package:flutter/material.dart';

import 'package:cup_flutter_app/app/core/ui/styles/text_styles.dart';
import 'package:cup_flutter_app/app/core/ui/widgets/button.dart';
import 'package:cup_flutter_app/app/pages/register/presenter/register_presenter.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;

  const RegisterPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bola.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Cadastrar Usuário',
                style: context.textStyles.titleBlack,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameEC,
                      decoration: const InputDecoration(
                        label: Text('Nome Completo'),
                      ),
                      validator: Validatorless.required('Obrigatório'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailEC,
                      decoration: const InputDecoration(
                        label: Text('E-mail'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.email('E-mail inválido'),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Senha'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.min(
                            6, 'Senha deve conter pelo menos 6 caracteres'),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Confirma Senha'),
                      ),
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required('Obrigatório'),
                          Validatorless.min(
                              6, 'Senha deve conter pelo menos 6 caracteres'),
                          Validatorless.compare(
                              _passwordEC, 'As senhas devem ser iguais')
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button.primary(
                      width: MediaQuery.of(context).size.width * .9,
                      label: 'Cadastrar',
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          showLoader();
                          widget.presenter.register(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            password: _passwordEC.text,
                            confirmPassword: _confirmPasswordEC.text,
                          );
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
