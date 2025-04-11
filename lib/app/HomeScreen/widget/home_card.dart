// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../custom_widgets/custom_colors.dart';
import '../model/home_type.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Card(
      color : AppColors.primaryColor.withOpacity(.2),
      elevation: 0,
      margin : EdgeInsets.only(
        bottom : Get.height * .02,
      ),
      shape : const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    child: InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      onTap: homeType.onTap(context),
      child: homeType.leftAlign ? Row(
        children: [
          Container(
            width : Get.width * .35,
            padding : homeType.padding,
            child : Lottie.asset('assets/lottie/${homeType.lottie}')
          ),
          const Spacer(),
          Text(
            homeType.title,
            style : const TextStyle(
              fontSize : 18,
              fontWeight : FontWeight.w500,
              letterSpacing: 1
            ),
            
          ),
          const Spacer(flex : 2)
        ],
      ) : Row(
          children: [
            const Spacer(flex : 2),
            Container(
              width: Get.width * .35,
              padding: homeType.padding,
              child: Lottie.asset('assets/lottie/${homeType.lottie}'),
            )
          ],
        )
      ,
    ),
    ).animate().fade(duration : GetNumUtils(1).seconds, curve : Curves.easeIn);
    
  }
}
