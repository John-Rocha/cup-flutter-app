import 'package:cup_flutter_app/app/pages/login/login_page.dart';
import 'package:cup_flutter_app/app/pages/login/presenter/login_presenter.dart';
import 'package:cup_flutter_app/app/pages/login/presenter/login_presenter_impl.dart';
import 'package:cup_flutter_app/app/services/login/login_service.dart';
import 'package:cup_flutter_app/app/services/login/login_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LoginRoute extends FlutterGetItPageRoute {
  const LoginRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<LoginService>(
          (i) => LoginServiceImpl(
            authRepository: i(),
          ),
        ),
        Bind.lazySingleton<LoginPresenter>(
          (i) => LoginPresenterImpl(
            loginService: i(),
          ),
        )
      ];
  @override
  WidgetBuilder get page => (context) => LoginPage(
        presenter: context.get(),
      );
}
