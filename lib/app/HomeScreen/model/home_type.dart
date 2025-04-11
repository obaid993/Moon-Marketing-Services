// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../page_and_routes/app_pages.dart';

enum HomeType { plotDetails, paymentPlan, agreementForm, allotmentLetter }

extension MyHomeType on HomeType {
  String get title => switch (this) {
        HomeType.plotDetails => 'Plot Details',
        HomeType.paymentPlan => "Payment Plan",
        HomeType.agreementForm => 'Agreement Form',
        HomeType.allotmentLetter => "Alottment Letter",
      };

  String get lottie => switch (this) {
        HomeType.plotDetails => 'details.json',
        HomeType.paymentPlan => 'paymentPlan.json',
        HomeType.agreementForm => 'agremeent.json',
        HomeType.allotmentLetter => 'letter.json'
      };

  bool get leftAlign => switch (this) {
        HomeType.plotDetails => true,
        HomeType.paymentPlan => true,
        HomeType.agreementForm => true,
        HomeType.allotmentLetter => true
      };

  EdgeInsets get padding => switch (this) {
        HomeType.plotDetails => EdgeInsets.zero,
        HomeType.paymentPlan => const EdgeInsets.all(20),
        HomeType.agreementForm => EdgeInsets.zero,
        HomeType.allotmentLetter => EdgeInsets.zero,
      };
  //for navigation
  Future? Function() onTap(BuildContext context) {
    switch (this) {
      case HomeType.plotDetails:
        return () => Get.toNamed(Routes.CUSTOMERPLOT);
      case HomeType.paymentPlan:
        return () => Get.toNamed(Routes.PAYMENTPLANPDF);
      case HomeType.agreementForm:
        return () => Get.toNamed(Routes.AGREEMENTPDF);
      case HomeType.allotmentLetter:
        return () => Get.toNamed(Routes.ASSIGNPLOTPDF);
    }
  }
}
