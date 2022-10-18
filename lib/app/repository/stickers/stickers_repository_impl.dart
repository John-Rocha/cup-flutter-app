// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cup_flutter_app/app/core/exceptions/repository_exception.dart';
import 'package:cup_flutter_app/app/core/rest/custom_dio.dart';
import 'package:cup_flutter_app/app/models/groups_stickers.dart';
import 'package:dio/dio.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;

  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupsStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data
          .map<GroupsStickers>((g) => GroupsStickers.fromMap(g))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar o album do usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar o album do usuário');
    }
  }
}
