
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_application/Utiles_routes/routes_name.dart';
import 'package:social_media_application/Utiles_routes/utile.dart';

class LoginController with ChangeNotifier{


  FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;
  bool get isLoading => loading;

  void setLoading(bool value){
    loading = value;
    notifyListeners();
  }

  void myLogin(BuildContext context, String email, String password) {

    setLoading(true);
    try{

      auth.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value){
        setLoading(false);
        Navigator.pushNamed(context, RouteName.DishdoardScreen);
      }).onError((error, stackTrace) {
        Utils.toastMessage('Please enter valid email and password');
        setLoading(false);
      });

    }
    catch(e){
      Utils.toastMessage('Something went wrong');
      setLoading(false);
    }

  }


}