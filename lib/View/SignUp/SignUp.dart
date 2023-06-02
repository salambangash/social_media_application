
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_application/Utiles_routes/routes_name.dart';
import 'package:social_media_application/View_Model/Controller/SignUp/SignUp.dart';
import 'package:social_media_application/res/Color.dart';
import 'package:social_media_application/res/Components/MyButton.dart';
import 'package:social_media_application/res/Components/My_Form_Field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final fullNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();


  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ChangeNotifierProvider(
              create: (_) => SignUpController(),
              child: Consumer<SignUpController>(
                builder: (context, provider, child){
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(height: height * .01,),
                        Text('WelCome To App', style: Theme.of(context).textTheme.displaySmall,),
                        SizedBox(height: height * .01,),
                        Text('Enter your email  address \n to register your account',
                          style: Theme.of(context).textTheme.titleMedium,),
                        SizedBox(height: height * .01,),

                        Form(
                            key: _formKey,
                            child: Padding(
                              padding:  EdgeInsets.only(top: height * .06, bottom: height * 0.01),
                              child: Column(
                                children: [
                                  MyTextFormField(
                                    myController: fullNameController,
                                    focusNode: fullNameFocusNode,
                                    onFieldSubmittedValue: (value){

                                    },
                                    onValidator: (value){
                                      return value!.isEmpty ? 'Please enter your Name' : null;
                                    },
                                    keyBoardType: TextInputType.name,
                                    hintText: 'user name',
                                    obscureText: false,
                                  ),
                                  SizedBox(height: height * 0.01,),
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
                                    onValidator: (value){
                                      return value!.isEmpty ? 'Please enter your password' : null;
                                    },
                                    keyBoardType: TextInputType.visiblePassword,
                                    hintText: 'Password',
                                    obscureText: true,
                                  ),
                                  SizedBox(height: height * 0.01,),
                                  MyTextFormField(
                                    myController: confirmPasswordController,
                                    focusNode: confirmPasswordFocusNode,
                                    onFieldSubmittedValue: (value){

                                    },
                                    onValidator: (value){
                                      return value!.isEmpty ? 'Please enter your C-Password' : null;
                                    },
                                    keyBoardType: TextInputType.visiblePassword,
                                    hintText: 'confirm Password',
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            )
                        ),

                        SizedBox(height: height * .03,),

                        MyButton(
                          title:'Sign Up',
                          loading: provider.loading,
                          onPress: (){
                            if(_formKey.currentState!.validate()){

                              provider.signUp(
                                fullNameController.text,
                                emailController.text,
                                passwordController.text,
                                confirmPasswordController.text,
                              );
                            }
                          },
                        ),
                        SizedBox(height: height * .03,),
                        InkWell(

                          onTap: (){
                            Navigator.pushNamed(context, RouteName.LoginView);
                          },
                          child: RichText(text: TextSpan(
                            text: ' If you have an account? ',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith( color:AppColors.primaryTextTextColor),
                            children: [
                              TextSpan(
                                text: 'Login',
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
                  );
                },
              ),
            )
        ),
      ),
    );
  }
}

