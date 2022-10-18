import 'package:cup_flutter_app/app/models/user_model.dart';

abstract class HomeView {
  void updateUser(UserModel userModel);
  void error(String message);
  void showLoader();
  void logoutSuccess();
}
