import 'package:cup_flutter_app/app/core/mvp/fwc_presenter.dart';

abstract class SplashPresenter extends FwcPresenter {
  Future<void> checkLogin();
}
