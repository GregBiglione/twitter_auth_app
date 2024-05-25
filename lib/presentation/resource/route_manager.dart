import 'package:flutter/material.dart';
import 'package:twitter_auth_app/presentation/resource/color_manager.dart';
import 'package:twitter_auth_app/presentation/resource/string_manager.dart';
import 'package:twitter_auth_app/presentation/screen/home/home_screen.dart';
import 'package:twitter_auth_app/presentation/screen/login/login_screen.dart';
import 'package:twitter_auth_app/presentation/screen/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(
            StringManager.noRouteFound,
            style: Theme.of(_).textTheme.displaySmall,
          ),
        ),
        backgroundColor: ColorManager.black,
        body: Center(
          child: Text(
            StringManager.noRouteFound,
            style: Theme.of(_).textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}