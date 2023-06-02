
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:social_media_application/Utiles_routes/routes_name.dart';
class SplashServices{


  void isLogin(BuildContext context){

    Timer(Duration(seconds: 3),() => Navigator.pushNamed(context, RouteName.LoginView) );

  }

}