import 'package:cup_flutter_app/app/core/mvp/fwc_presenter.dart';
import 'package:cup_flutter_app/app/pages/splash/view/splash_view.dart';

abstract class SplashPresenter extends FwcPresenter<SplashView> {
  Future<void> checkLogin();
}
