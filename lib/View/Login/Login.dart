
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_application/Utiles_routes/routes_name.dart';
import 'package:social_media_application/View_Model/Controller/Login/Sigin.dart';
import 'package:social_media_application/res/Color.dart';
import 'package:social_media_application/res/Components/MyButton.dart';
import 'package:social_media_application/res/Components/My_Form_Field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: height * .01,),
                Text('WelCome To App', style: Theme.of(context).textTheme.displaySmall,),
                SizedBox(height: height * .01,),
                Text('Enter your email  address \n to connect your account',
                  style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(height: height * .01,),

                Form(
                    key: _formKey,
                    child: Padding(
                      padding:  EdgeInsets.only(top: height * .06, bottom: height * 0.01),
                      child: Column(
                        children: [
                          MyTextFormField(
                            myController: emailController,
                            focusNode: emailFocusNode,
                            onFieldSubmittedValue: (value){

                            },
                            onValidator: (value){
                              return value!.isEmpty ? 'Please enter your email' : null;
                            },
                            keyBoardType: TextInputType.emailAddress,
                            hintText: 'Email',
                            obscureText: false,
                          ),
                          SizedBox(height: height * 0.01,),
                          MyTextFormField(
                            myController: passwordController,
                            focusNode: passwordFocusNode,
                            onFieldSubmittedValue: (value){

                            },
                            onValidator: (value) {
                              return value!.isEmpty ? 'Please enter your password' : null;
                            },
                            keyBoardType: TextInputType.visiblePassword,
                            hintText: 'Password',
                            obscureText: true,
                          ),
                        ],
                      ),
                    )
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password?',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),),
                ),
                SizedBox(height: height * .03,),

                ChangeNotifierProvider(
                  create: (_) => LoginController(),
                  child: Consumer<LoginController>(
                      builder: (context, provider, chile){
                        return MyButton(
                          title:'Login',
                          loading: provider.isLoading,
                          onPress: (){
                            if(_formKey.currentState!.validate()) {
                              provider.myLogin(context,
                                  emailController.text,
                                  passwordController.text
                              );
                            }
                          },
                        );
                      }
                  ),
                ),


                SizedBox(height: height * .03,),

                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.SignUpScreen);
                  },
                  child: RichText(text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith( color:AppColors.primaryTextTextColor),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
