import 'package:cup_flutter_app/app/core/mvp/fwc_presenter.dart';
import 'package:cup_flutter_app/app/pages/home/view/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
