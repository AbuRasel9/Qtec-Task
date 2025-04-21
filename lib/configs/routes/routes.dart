import 'package:flutter/material.dart';
import 'package:task/configs/routes/routes_name.dart';
import 'package:task/view/auth/sign_up_screen.dart';
import 'package:task/view/home/home_screen.dart';
import 'package:task/view/home/subModules/details_view/details_view.dart';

import '../../view/auth/sign_in_screen.dart';
import '../../view/splash/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignInScreen());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpScreen());
        case RoutesName.detailsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DetailsScreen());
        case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
