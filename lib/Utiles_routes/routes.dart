import 'package:flutter/material.dart';
import 'package:social_media_application/Utiles_routes/routes_name.dart';
import 'package:social_media_application/View/Login/Login.dart';
import 'package:social_media_application/View/SignUp/SignUp.dart';
import 'package:social_media_application/View/Splash/Splash.dart';
import 'package:social_media_application/View/dishboard/dishboard.dart';


class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteName.LoginView:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteName.SignUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case RouteName.DishdoardScreen:
        return MaterialPageRoute(builder: (_) => dashboardScreen());


      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}