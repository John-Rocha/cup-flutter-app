// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cup_flutter_app/app/pages/home/view/home_view.dart';
import 'package:cup_flutter_app/app/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './home_presenter.dart';

class HomePresenterImpl implements HomePresenter {
  // ignore: unused_field
  final UserRepository userRepository;
  late HomeView _view;

  HomePresenterImpl({required this.userRepository});

  @override
  Future<void> getUserData() async {
    try {
      _view.showLoader();
      final user = await userRepository.getMe();
      _view.updateUser(user);
    } catch (e) {
      _view.error('Erro ao buscar dados do usuário');
    }
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    _view.logoutSuccess();
  }

  @override
  set view(HomeView view) => _view = view;
}
