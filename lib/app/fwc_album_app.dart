import 'package:cup_flutter_app/app/core/ui/theme/theme_config.dart';
import 'package:cup_flutter_app/app/pages/home/home_page.dart';
import 'package:cup_flutter_app/app/pages/login/login_page.dart';
import 'package:cup_flutter_app/app/pages/splash/view/splash_route.dart';
import 'package:flutter/material.dart';

class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FIFA World Cup Album',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashRoute(),
        '/auth/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
