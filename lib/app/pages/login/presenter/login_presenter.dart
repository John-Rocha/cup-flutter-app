import 'package:cup_flutter_app/app/core/mvp/fwc_presenter.dart';
import 'package:cup_flutter_app/app/pages/login/view/login_view.dart';

abstract class LoginPresenter extends FwcPresenter<LoginView> {
  Future<void> login(String email, String password);
}
