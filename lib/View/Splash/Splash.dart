import 'package:flutter/material.dart';
import 'package:social_media_application/View_Model/Services/Splash_secvices.dart';
import 'package:social_media_application/res/Fonts.dart';


import '../../res/color.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices services = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    services.isLogin(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text('Splash Screen' ,
                  style: TextStyle(fontFamily: AppFonts.sfProDisplayBold, color: Colors.white , fontSize: 40, fontWeight: FontWeight.w700),)),
              )
            ],
          )
      ),
    );
  }
}