import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final int id;
  final String name;

  // Total de figurinhas do album
  final int totalAlbum;

  // Total de figurinhas que eu tenho no album
  final int stickers;

  // Total de figurinhas duplicadas
  final int totalDuplicates;

  // Total de figurinhas que faltam para completar o seu album
  final int totalComplete;

  // Porcentagem das figurinhas
  final int totalCompletePercent;

  UserModel({
    required this.id,
    required this.name,
    required this.totalAlbum,
    required this.stickers,
    required this.totalDuplicates,
    required this.totalComplete,
    required this.totalCompletePercent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'totalAlbum': totalAlbum,
      'stickers': stickers,
      'totalDuplicates': totalDuplicates,
      'totalComplete': totalComplete,
      'totalCompletePercent': totalCompletePercent,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      totalAlbum: map['total_album'] as int,
      stickers: map['total_stickers'] as int,
      totalDuplicates: map['total_duplicates'] as int,
      totalComplete: map['total_complete'] as int,
      totalCompletePercent: map['total_complete_percent'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
