
import 'package:flutter/material.dart';
import 'package:social_media_application/res/Color.dart';


class dashboardScreen extends StatefulWidget {
  const dashboardScreen({Key? key}) : super(key: key);

  @override
  State<dashboardScreen> createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('DishBoard'),
            elevation: 0,
            centerTitle: true,
            backgroundColor:AppColors.primaryColor
        ),

        body: const Center(
          child: Text('DishBoard'),
        )
    );
  }
}
