import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:social_media_application/Utiles_routes/utile.dart';

class SignUpController with ChangeNotifier{


  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('users');

  bool loading = false;
  bool get isLoading => loading;

  void setLoading(bool value){
    loading = value;
    notifyListeners();
  }


  void signUp(String name, String email, String password, String confirmPassword) {

    setLoading(true);
    try{

      auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {

        dbRef.child(value.user!.uid).set({
          'Uid' : value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'password': password,
          'confirmPassword': confirmPassword,
          'name': name,
          'Phone': "",
          'Status': "NoOne",
          'image': ""
        }).then((value){
          setLoading(false);
          Utils.toastMessage("User Created Successfully");
        });
        Utils.toastMessage("User Created Successfully");
        setLoading(false);
      }).onError((error, stackTrace) {
        Utils.toastMessage('Email already exists');
        setLoading(false);
      });

    }
    catch(e){
      Utils.toastMessage('Something went wrong');
      setLoading(false);
    }

  }



}