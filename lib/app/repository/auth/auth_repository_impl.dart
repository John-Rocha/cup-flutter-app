import 'dart:developer';

import 'package:cup_flutter_app/app/core/exceptions/repository_exception.dart';
import 'package:cup_flutter_app/app/core/rest/custom_dio.dart';
import 'package:cup_flutter_app/app/models/register_user_model.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    return '';
  }

  @override
  Future<void> logout() async {}

  @override
  Future<void> register(RegisterUserModel register) async {
    try {
      await dio.unAuth().post(
            '/api/register',
            data: register.toMap(),
          );
    } on DioError catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar usuário');
    }
  }
}
