
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_application/res/Color.dart';
class MyTextFormField extends StatelessWidget {
  const MyTextFormField({Key? key,

    required this.myController,
    required this.focusNode,
    required this.onFieldSubmittedValue,
    required this.onValidator,
    required this.keyBoardType,
    required this.hintText,
    required this.obscureText,
    this.enable = true,
    this.autoFocus = false,


  }) : super(key: key);

  final TextEditingController  myController;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;

  final TextInputType keyBoardType;
  final String hintText;
  final bool obscureText;
  final bool enable, autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(

        controller: myController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        obscureText: obscureText,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 19,color: AppColors.primaryTextTextColor),

        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 0, color: AppColors.primaryTextTextColor.withOpacity(0.8)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  const BorderSide(color: AppColors.textFieldDefaultFocus,),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.secondaryColor,),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.alertColor,),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.textFieldDefaultBorderColor,),
          ),
        ),


      ),
    );
  }
}
