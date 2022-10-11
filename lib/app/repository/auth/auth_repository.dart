import 'package:cup_flutter_app/app/models/register_user_model.dart';

abstract class AuthRepository {
  Future<void> register(RegisterUserModel register);
  Future<String> login({required String email, required String password});
  Future<void> logout();
}
