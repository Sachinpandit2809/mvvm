import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signup_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final argume = settings.arguments;
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route define"),
            ),
          );
        });
    }
  }
}
