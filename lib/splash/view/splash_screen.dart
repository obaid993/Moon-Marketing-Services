// ignore_for_file: use_super_parameters, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_marketing_services/splash/controller/splash_screen_controller.dart';

import '../../app/custom_widgets/custom_colors.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor : AppColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              // color: AppColors.primaryColor,
              // color : Colors.white,
              width: size.width,
              height: size.height,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/moon.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                "Powered by Tech Forge Solution",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
