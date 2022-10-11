// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cup_flutter_app/app/models/register_user_model.dart';
import 'package:cup_flutter_app/app/pages/register/view/register_view.dart';
import 'package:cup_flutter_app/app/repository/auth/auth_repository.dart';

import './register_presenter.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  late final RegisterView _view;
  final AuthRepository authRepository;

  RegisterPresenterImpl({required this.authRepository});

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final registerUserModel = RegisterUserModel(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      await authRepository.register(registerUserModel);
      _view.registerSuccess();
    } catch (e) {
      log('Erro ao cadastrar usuário', error: e);
      _view.registerError();
    }
  }

  @override
  set view(RegisterView view) => _view = view;
}
