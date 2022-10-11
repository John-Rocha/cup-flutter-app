import 'package:cup_flutter_app/app/pages/splash/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './splash_presenter.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;
  @override
  Future<void> checkLogin() async {
    _view.showLoader();

    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    _view.logged(accessToken != null);
  }

  @override
  set view(view) => _view = view;
}
