import 'package:cup_flutter_app/app/core/rest/custom_dio.dart';
import 'package:cup_flutter_app/app/core/ui/theme/theme_config.dart';
import 'package:cup_flutter_app/app/pages/home/home_page.dart';
import 'package:cup_flutter_app/app/pages/login/login_page.dart';
import 'package:cup_flutter_app/app/pages/splash/view/splash_route.dart';
import 'package:cup_flutter_app/app/repository/auth/auth_repository.dart';
import 'package:cup_flutter_app/app/repository/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i()))
      ],
      child: MaterialApp(
        title: 'FIFA World Cup Album',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashRoute(),
          '/auth/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
