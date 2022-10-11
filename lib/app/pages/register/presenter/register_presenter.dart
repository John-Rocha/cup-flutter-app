import 'package:cup_flutter_app/app/core/mvp/fwc_presenter.dart';
import 'package:cup_flutter_app/app/pages/register/view/register_view.dart';

abstract class RegisterPresenter extends FwcPresenter<RegisterView> {
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
