import 'package:cup_flutter_app/app/core/rest/custom_dio.dart';
import 'package:cup_flutter_app/app/core/ui/global/global_context.dart';
import 'package:cup_flutter_app/app/core/ui/global/global_context_impl.dart';
import 'package:cup_flutter_app/app/core/ui/theme/theme_config.dart';
import 'package:cup_flutter_app/app/pages/home/home_route.dart';
import 'package:cup_flutter_app/app/pages/login/login_route.dart';
import 'package:cup_flutter_app/app/pages/register/register_route.dart';
import 'package:cup_flutter_app/app/pages/splash/splash_route.dart';
import 'package:cup_flutter_app/app/repository/auth/auth_repository.dart';
import 'package:cup_flutter_app/app/repository/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class FwcAlbumApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  FwcAlbumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>(
          (i) => GlobalContextImpl(
            navigatorKey: navigatorKey,
            authRepository: i(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'FIFA World Cup Album',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        navigatorKey: navigatorKey,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashRoute(),
          '/auth/login': (context) => const LoginRoute(),
          '/auth/register': (context) => const RegisterRoute(),
          '/home': (context) => const HomeRoute(),
        },
      ),
    );
  }
}
